//
// Created by xia on 20-4-21.
//

#include <cloud_to_grid/Grid_Tool.h>
namespace MyTool {

    std::vector<double> transCoor(double x,double y,double z,Eigen::MatrixXd SE3transform){
        std::vector<double> ret;
        Eigen::MatrixXd inverseRobotPose = SE3transform;//.inverse();
        Eigen::Vector4d cloud_loc(4);
        cloud_loc << x,y,z, 1.0;
        cloud_loc = inverseRobotPose * cloud_loc;
        //ret << cloud_loc(0),cloud_loc(1),cloud_loc(2);
        ret.push_back(cloud_loc(0));
        ret.push_back(cloud_loc(1));
        ret.push_back(cloud_loc(2));
        return ret;
    }
    void filterPointCloud(PointCloud::Ptr &cloud){
        pcl::PointCloud<PointType>::Ptr cloud_filtered (new pcl::PointCloud<PointType>);  
        pcl::RadiusOutlierRemoval<PointType> ror;	//创建滤波器对象
	    ror.setInputCloud(cloud);						//设置待滤波点云
	    ror.setRadiusSearch(0.10);						//设置查询点的半径范围
	    ror.setMinNeighborsInRadius(5);	//设置判断是否为离群点的阈值，即半径内至少包括的点数
	    //ror.setNegative(true);	//默认false，保存内点；true，保存滤掉的外点
	    ror.filter(*cloud_filtered);	//执行滤波，保存滤波结果于cloud_filtered
        //分成若干网格，体素滤波
        pcl::VoxelGrid<PointType> sor2;  
        sor2.setInputCloud(cloud_filtered);  
        // 设置滤波器的叶子大小，0.01f表示每个体素的大小为1cm  
        sor2.setLeafSize(0.01f, 0.01f, 0.01f);  
        // 创建一个新的点云对象来存储滤波后的结果  
        pcl::PointCloud<PointType>::Ptr cloud_filtered2 (new pcl::PointCloud<PointType>);   
        sor2.filter(*cloud_filtered2);  
        // 将结果存储回原来的cloud对象  
        *cloud = *cloud_filtered2;
    }

    void GetGridCoord(const double temp_x,const double temp_y,int &x,int &y) {
        x = int(temp_x / param.cellResolution);
        y = int(temp_y / param.cellResolution);
    }

    void RemoveUnusedPoint(PointCloud::Ptr &cloud) {
#ifdef DEBUG
        cout<<"start RemoveUnusedPoint"<<endl;
#endif
        long i=0;
        PointCloud::iterator it = cloud->points.begin();
        while (it != cloud->points.end()) {
            float x = it->x;
            float y = it->y;
            float z = it->z;
            //float rgb = it->rgb;
            if ((z>param.clip_max)||(z<param.clip_min)) {
                it=cloud->points.erase(it);
                i++;
            } else
                ++it;
        }
#ifdef DEBUG
         cout<<"end RemoveUnusedPoint,remove total: "<<i<<endl;
#endif
    }

    MyGrid::MyGrid(void):cloudNormalPtr(new NormalCloud()) {
        SE3transform=Eigen::MatrixXd(4,4);
    }

    void MyGrid::calcSurfaceNormals(PointCloud::Ptr &cloud) {
#ifdef DEBUG
        cout<<"start calcSurfaceNormals"<<endl;
#endif
        pcl::NormalEstimation<PointType, pcl::Normal> ne;
        ne.setInputCloud(cloud);
        pcl::search::KdTree<PointType>::Ptr tree(new pcl::search::KdTree<PointType>());
        ne.setSearchMethod(tree);
        ne.setRadiusSearch(param.searchRadius);
        cloudNormalPtr->points.clear();
        ne.compute(*cloudNormalPtr);
#ifdef DEBUG
        cout<<"end calcSurfaceNormals"<<endl;
#endif
    }

    void MyGrid::getMinMaxXY(std::map<Coordiate, int> &tmp_gridPoints, int &min_x, int &max_x, int &min_y, int &max_y) {
#ifdef DEBUG
        cout<<"start getMinMaxXY"<<endl;
#endif
        int x, y;
        std::map<Coordiate, int>::iterator it;
        it = tmp_gridPoints.begin();
        while (it != tmp_gridPoints.end()) {
            x = it->first.x;
            y = it->first.y;
            if (x > max_x)
                max_x = x;
            if (x < min_x)
                min_x = x;
            if (y > max_y)
                max_y = y;
            if (y < min_y)
                min_y = y;
            ++it;
        }
#ifdef DEBUG
        cout<<"end getMinMaxXY"<<endl;
#endif
    }

    void MyGrid::updateGrid(PointCloud::Ptr &cloud) {
#ifdef DEBUG
        cout<<"start updateGrid"<<endl;
#endif  
        updateAccPointCloud(cloud,SE3transform);
        RemoveUnusedPoint(cloud);
        calcSurfaceNormals(cloud);
        //filter
        //filterPointCloud(cloud);
        for (decltype(cloud->size()) i = 0; i < cloud->size(); i++) {
            double normal_value;
            double height;
            double axis_1;
            double axis_2;
            normal_value = cloudNormalPtr->points[i].normal_z;
            height = cloud->points[i].z;
            axis_1 = cloud->points[i].x;
            axis_2 = cloud->points[i].y;
            std::vector<double> newCoor;
            newCoor = transCoor(axis_1,axis_2,height,SE3transform);

            double score;
            scoreFun(normal_value, height, score);

            int grid_x, grid_y;
            GetGridCoord(newCoor[0], newCoor[1], grid_x, grid_y);
            Coordiate key(grid_x, grid_y);
            int count = gridPoints.count(key);
            if (count > 0) {
                int &gridPointCount = gridPoints.find(key)->second;
                if (score >= param.deviation/*height >= -1.0*/) {
                    gridPointCount = min(10,gridPointCount+1);
                    //gridPointCount++;
                } else {
                    gridPointCount = max(0, gridPointCount-1);
                    continue;
                }
            } else {
               gridPoints.insert(std::pair<Coordiate, int>(key, 0));
                if (score >= param.deviation)
                    gridPoints[key]++;
                //if (height >= 0.01)
                 //   gridPoints[key]++;
            }
        }
#ifdef DEBUG
        cout<<"end updateGrid"<<endl;
#endif
    }

    void MyGrid::scoreFun(double normal_z, double z, double &score) {
        double part_nomal = 1 - fabs(normal_z);
        double part_z = 1 - exp(-fabs(z));
        score = param.sigma * part_nomal + (1.0 - param.sigma) * part_z;
    }

    void MyGrid::getMapMetadata(MapMetaData &data) {
#ifdef DEBUG
         cout<<"start getMapdata"<<endl;
#endif
        isUpdateGrid = true;
        if (gridPoints.size() > 0) {
            int min_x = 0, max_x = 0, min_y = 0, max_y = 0;
            getMinMaxXY(gridPoints, min_x, max_x, min_y, max_y);
            ocGrid = std::vector<signed char>(param.border_grids*param.border_grids,-1);
            auto it = gridPoints.begin();
            while (it != gridPoints.end()) {
                ++it;
                int x = it->first.x;
                int y = it->first.y;
                int position = (y + param.border_grids/2) * param.border_grids + x + param.border_grids/2;
                if(position>ocGrid.size()||position<0)
                    continue;
                int counter = it->second;
                if (counter > param.threshold)
                    ocGrid[position] = 100;
                else ocGrid[position] = 0;

            }
            data.data = ocGrid;
            data.height = param.border_grids;
            data.width = param.border_grids;
            data.xMin = min_x;
            data.yMin = min_y;
            data.map_length = param.map_size;
            data.resolution = param.cellResolution;
        }
#ifdef DEBUG
        cout<<"end getMapdata"<<endl;
#endif
    isUpdateGrid = false;
    }
    void MyGrid::update(PointCloud::Ptr& cloud,MapMetaData &data,double (&SE3)[16])
    {
#ifdef DEBUG
        cout<<"update"<<endl;
#endif
        if(isUpdateGrid ||(!param.mode&&isGlobalUpdate)){return;}
        if(!param.mode){
            gridPoints.clear();
            isGlobalUpdate = true;
        }
        updateGrid(cloud); 
        updateSE3(SE3);
        getMapMetadata(data);
    }
    void MyGrid::updateSE3(double (&SE3)[16])
    {
        SE3transform<<SE3[0],SE3[4],SE3[8],SE3[12],
                      SE3[1],SE3[5],SE3[9],SE3[13],
                      SE3[2],SE3[6],SE3[10],SE3[14],
                      SE3[3],SE3[7],SE3[11],SE3[15];
        cout<<SE3transform<<endl;

    }
    void MyGrid::updateAccPointCloud(PointCloud::Ptr& cloud,Eigen::MatrixXd SE3transform){
        PointCloud::iterator it = cloud->points.begin();
        cout<<it->x<<" "<<it->y<<" "<<it->z<<endl;
        cout<<SE3transform<<endl;
        std::vector<double> newCoorOut=transCoor(it->x,it->y,it->z,SE3transform);
        cout<<newCoorOut[0]<<" "<<newCoorOut[1]<<" "<<newCoorOut[2]<<endl;
        while (it != cloud->points.end()) {
            float x = it->x;
            float y = it->y;
            float z = it->z;
            //float rgb = it->rgb;
            std::vector<double> newCoor=transCoor(x,y,z,SE3transform);
 
            // 创建一个PointXYZ的点
            PointType newPoint;
            newPoint.x = newCoor[0];  // 设置点的x坐标
            newPoint.y = newCoor[1];  // 设置点的y坐标
            newPoint.z = newCoor[2];  // 设置点的z坐标
 
            // 将点插入到点云中
            accPointCloud.push_back(newPoint);
            it++;
        }
    }
    pcl::PointCloud<PointType> MyGrid::getAccPointCloud(){
        return this->accPointCloud;
    }
}

