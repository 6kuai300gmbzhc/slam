//
// Created by xia on 20-4-21.
//

#include <cloud_to_grid/Grid_Tool.h>

namespace MyTool {

    std::vector<double> transCoor(double x,double y,double z,Eigen::MatrixXd SE3transform){
        std::vector<double> ret;
        Eigen::MatrixXd RobotPose = SE3transform;//.inverse();
        Eigen::Vector4d cloud_loc(4);
        cloud_loc << x,y,z,1.0;
        cloud_loc = RobotPose * cloud_loc;
        //ret << cloud_loc(0),cloud_loc(1),cloud_loc(2);
        //ret.push_back(cloud_loc(0));
        //ret.push_back(cloud_loc(1));
        //ret.push_back(cloud_loc(2));
        ret.push_back(x);
        ret.push_back(y);
        ret.push_back(z);
        return ret;
    }
    void transCoorAxis(PointCloud::Ptr &cloud){
        for (decltype(cloud->size()) i = 0; i < cloud->size(); i++) {
            double newx=cloud->points[i].z;
            double newy=-1.0*cloud->points[i].x;
            double newz=-1.0*cloud->points[i].y;
            cloud->points[i].x=newx;
            cloud->points[i].y=newy;
            cloud->points[i].z=newz;
        }
    }
    //TODO
    
    std::vector<double> getLocalCoor(double x,double y,double z,Eigen::MatrixXd SE3transform){
        std::vector<double> ret;
        Eigen::MatrixXd RobotPose = SE3transform;//.inverse();
        Eigen::Vector4d global_loc(4);
        Eigen::Vector4d local_loc(4);
        global_loc << x,y,z,1.0;
        local_loc = RobotPose * global_loc;
        //ret << cloud_loc(0),cloud_loc(1),cloud_loc(2);
        //ret.push_back(cloud_loc(0));
        //ret.push_back(cloud_loc(1));
        //ret.push_back(cloud_loc(2));
        ret.push_back(local_loc(0));
        ret.push_back(local_loc(1));
        ret.push_back(local_loc(2));
        return ret;
    }
    bool whetherRelocate(Eigen::MatrixXd SE3transform){
        //TODO
        // 提取旋转矩阵部分  
        Eigen::Matrix3d R = SE3transform.block<3, 3>(0, 0);  
        //  检查Z轴旋转角  
        Eigen::AngleAxisd angleAxis(R);  
        double angle = angleAxis.angle(); // 旋转角（弧度）  
        Eigen::Vector3d axis = angleAxis.axis(); // 旋转轴  
        // 判断Z轴旋转角是否接近0或π（180度）  
        const double threshold = std::acos(-1.0) / 180.0 * 10.0; // 10度为阈值 
        if(SE3transform(2,3)>0.2||SE3transform(2,3)<0||std::abs(angle - 0.0) < threshold || std::abs(angle - std::acos(-1.0)) < threshold){
            return true;
        }else{
            return false;
        }
    }
    //想要得到的是把全局坐标转换回局部坐标，然后经过x，y轴上的旋转与平移，同时还要计算每个点的法向量，来用于对比
    Eigen::Vector3d relocatePoints(double x,double y,double z,Eigen::MatrixXd SE3transform){  
            std::vector<double> localCoor=getLocalCoor(x,y,z,SE3transform);
            //PointType pointToAdd;
            //pointToAdd.x=localCoor[0]+SE3transform(0,3);
            //pointToAdd.y=localCoor[1]+SE3transform(1,3);
            //pointToAdd.z=localCoor[2];
            Eigen::MatrixXd invSE3transform=SE3transform.inverse();
            cout<<"inv:"<<endl;
            cout<<invSE3transform<<endl;
            Eigen::Matrix3d R = invSE3transform.block<3, 3>(0, 0);  
            Eigen::Vector3d t = invSE3transform.block<3, 1>(0, 3);
            Eigen::Matrix3d R_new;  
            R_new << R(0, 0), R(0, 1), 0,  
                    R(1, 0), R(1, 1), 0,  
                    0,       0,       1;
            Eigen::Vector3d t_new(t(0), t(1), 0);
            //Eigen::Vector3d global_point; // 假设这是你要转换的全局点
            //global_point<<x,y,z;  
            Eigen::Vector3d local_point;
            local_point<<localCoor[0],localCoor[1],localCoor[2];
            Eigen::Vector3d new_global_point;
            new_global_point = R_new * local_point + t_new;     
            return new_global_point;  
    }
    
    
    
    void filterPointCloud(PointCloud::Ptr &cloud){
        PointCloud::Ptr cloud_filtered (new PointCloud);  
        pcl::RadiusOutlierRemoval<PointType> ror;	//创建滤波器对象
	    ror.setInputCloud(cloud);						//设置待滤波点云
	    ror.setRadiusSearch(0.05);						//设置查询点的半径范围
	    ror.setMinNeighborsInRadius(3);	//设置判断是否为离群点的阈值，即半径内至少包括的点数
	    //ror.setNegative(true);	//默认false，保存内点；true，保存滤掉的外点
	    ror.filter(*cloud_filtered);	//执行滤波，保存滤波结果于cloud_filtered
        cloud.reset();
        cloud=cloud_filtered;
        /*
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
        */
    //    long j=0;
    //     PointCloud::iterator it = cloud->points.begin();
    //     while (it != cloud->points.end()) {
    //         it++;
    //         j++;       
    //     }
    //     cloud->points.clear();
    //     cout<<"after filter remove points:"<<j<<endl;
    //     long i=0;
    //     PointCloud::iterator it2 = cloud_filtered->points.begin();
    //     while (it2 != cloud_filtered->points.end()) {
    //         float x = it2->x;
    //         float y = it2->y;
    //         float z = it2->z;
    //         PointType pointToAdd;
    //         pointToAdd.x = x;
    //         pointToAdd.y = y;
    //         pointToAdd.z = z;
    //         //float rgb = it->rgb;
    //         cloud->push_back(pointToAdd);
    //         it2++;
    //         i++;
    //     }
    //     cout<<"after filter remain points:"<<i<<endl;
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
            if ((z>30*param.clip_max)||(z<param.clip_min)) {
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
#ifdef DEBUG_PCL
        accPointCloud.clear();
#endif
        //滤波器
        filterPointCloud(cloud);

        //计算法向量
        calcSurfaceNormals(cloud);

        // //改变坐标轴
        // transCoorAxis(cloud);
        // //判断小车是否还认为自己在地面上，如果不是，要重新修复点云的坐标
        // // if(whetherRelocate(SE3transform)){
        // //     relocatePoints(cloud,SE3transform);
        // // }
        
        bool relocate=whetherRelocate(SE3transform);//判断是否在地面上且面对水平方向
        // //去除无用的点
        // RemoveUnusedPoint(cloud);

        // updateAccPointCloud(cloud,SE3transform);
        //更新grid
        for (decltype(cloud->size()) i = 0; i < cloud->size(); i++) {
            //修正坐标轴
            double newx=cloud->points[i].z;
            double newy=-1.0*cloud->points[i].x;
            double newz=-1.0*cloud->points[i].y;

            //去除无用点
            if ((newz>30*param.clip_max)||(newz<param.clip_min)) {
                continue;
            }

            //如果偏移，重新定位并将新的数据存回点云里
            if(relocate){
                Eigen::Vector3d new_global_coor=relocatePoints(newx,newy,newz,SE3transform);
                cloud->points[i].z=new_global_coor(0);
                cloud->points[i].x=-1.0*new_global_coor(1);
                cloud->points[i].y=-1.0*new_global_coor(2);
            }

#ifdef DEBUG_PCL
            //cout<<SE3transform<<endl;
            //使accpointcloud里面存储的是点云的局部坐标数据（相对于摄像头）
            std::vector<double> localCoor=getLocalCoor(newx,newy,newz,SE3transform);

            // 创建一个PointXYZ的点
            PointType newPoint;
            newPoint.x = localCoor[0];  // 设置点的x坐标
            newPoint.y = localCoor[1];  // 设置点的y坐标
            newPoint.z = localCoor[2];  // 设置点的z坐标
 
            // 将点插入到点云中
            accPointCloud.push_back(newPoint);
#endif

            double normal_value;
            double height;
            double axis_1;
            double axis_2;
            normal_value = cloudNormalPtr->points[i].normal_y;//因计算法向量时还未修正坐标
            height = newz;
            axis_1 = newx;
            axis_2 = newy;

            double score;
            scoreFun(normal_value, height, score);

            int grid_x, grid_y;
            GetGridCoord(axis_1, axis_2, grid_x, grid_y);
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
            //getMinMaxXY(gridPoints, min_x, max_x, min_y, max_y);
            ocGrid = std::vector<signed char>(param.border_grids*param.border_grids,-1);
            auto it = gridPoints.begin();
            while (it != gridPoints.end()) {
                ++it;
                int x = it->first.x;
                int y = it->first.y;
                if (x > max_x)
                    max_x = x;
                if (x < min_x)
                    min_x = x;
                if (y > max_y)
                    max_y = y;
                if (y < min_y)
                    min_y = y;
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
#ifdef DEBUG
        cout<<"updateSE3"<<endl;
#endif
        SE3transform<<SE3[10],-SE3[2],-SE3[6],SE3[14],
                      -SE3[8],SE3[0],SE3[4],-SE3[12],
                      -SE3[9],SE3[1],SE3[5],-SE3[13],
                      SE3[11],-SE3[3],SE3[-7],SE3[15];
        //Eigen
#ifdef DEBUG
        cout<<SE3transform<<endl;
#endif
        
        

    }
    void MyGrid::updateAccPointCloud(PointCloud::Ptr& cloud,Eigen::MatrixXd SE3transform){
        PointCloud::iterator it = cloud->points.begin();
        cout<<SE3transform<<endl;
        accPointCloud.clear();
        while (it != cloud->points.end()) {
            float x = it->x;
            float y = it->y;
            float z = it->z;
            //使accpointcloud里面存储的是点云的局部坐标数据（相对于摄像头）
            std::vector<double> localCoor=getLocalCoor(x,y,z,SE3transform);

            // 创建一个PointXYZ的点
            PointType newPoint;
            newPoint.x = localCoor[0];  // 设置点的x坐标
            newPoint.y = localCoor[1];  // 设置点的y坐标
            newPoint.z = localCoor[2];  // 设置点的z坐标
 
            // 将点插入到点云中
            accPointCloud.push_back(newPoint);
            it++;
        }
    }
    pcl::PointCloud<PointType> MyGrid::getAccPointCloud(){
        return this->accPointCloud;
    }
    std::map<Coordiate, int> MyGrid::getGridPoints(){
        return this->gridPoints;
    }
}

