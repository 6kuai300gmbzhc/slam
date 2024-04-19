
终端1：
cd catkin_ws
source devel/setup.bash
roslaunch robot_sim_demo robot_spawn.launch

终端2:
cd ORB_SLAM3_detailed_comment

ROS_NAMESPACE=robot1 rosrun ORB_SLAM3 RGBD Vocabulary/ORBvoc.txt Examples_old/RGB-D/TUM1.yaml /cam0/rgb/image_raw:=/robot1/cam0/rgb/image_raw /cam0/depth/image_raw:=/robot1/cam0/depth/image_raw

终端3：
cd ORB_SLAM3_detailed_comment
ROS_NAMESPACE=robot2 rosrun ORB_SLAM3 RGBD Vocabulary/ORBvoc.txt Examples_old/RGB-D/TUM1.yaml /cam0/rgb/image_raw:=/robot2/cam0/rgb/image_raw /cam0/depth/image_raw:=/robot2/cam0/depth/image_raw

终端4：
cd catkin_ws
source devel/setup.bash
roslaunch robot_sim_demo cloud_to_grid.launch


rqt_graph 看topic
rostopic echo 看topic内容
rostopic type 看topic类型
rosnode list 看topic 都有那些
