依赖：Eigen3 Pangolin opencv4.2 boost
其中catkin_Ws目录下是需要ROS的模块，需要ros的工作空间
orbslam3不用，但是它和catkin_ws应该放到同一个目录下面，要不然启动不了

终端1：
cd catkin_ws
source devel/setup.bash
roslaunch robot_sim_demo robot_spawn.launch

终端2:
cd ORB_SLAM3_detailed_comments

ROS_NAMESPACE=robot1 rosrun ORB_SLAM3 RGBD Vocabulary/ORBvoc.txt Examples_old/RGB-D/TUM1.yaml /cam0/rgb/image_raw:=/robot1/cam0/rgb/image_raw /cam0/depth/image_raw:=/robot1/cam0/depth/image_raw

终端3：
cd ORB_SLAM3_detailed_comments
ROS_NAMESPACE=robot2 rosrun ORB_SLAM3 RGBD Vocabulary/ORBvoc.txt Examples_old/RGB-D/TUM1.yaml /cam0/rgb/image_raw:=/robot2/cam0/rgb/image_raw /cam0/depth/image_raw:=/robot2/cam0/depth/image_raw

终端4：
cd catkin_ws
source devel/setup.bash
roslaunch robot_sim_demo cloud_to_grid.launch

修改orbslam3后编译：运行orbslam3文件夹下面的build.sh与build_ros.sh
打开rviz需要修改一下订阅的topic
在cloud_to_grid下面的drid_tool.h里面有一些调试选项，打开后可以看到pcl2点云与局部地图
