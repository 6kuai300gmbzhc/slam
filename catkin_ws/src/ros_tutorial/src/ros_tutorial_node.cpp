    #include <ros/ros.h>
    #include <sensor_msgs/Image.h>
    #include <cv_bridge/cv_bridge.h>
    #include <opencv2/opencv.hpp>
    void imageCallback(const sensor_msgs::ImageConstPtr& msg) {
        try {
            cv::Mat image = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::TYPE_16UC1)->image;
            cv::imshow("Received Image", image);
            cv::waitKey(1);
        } catch (cv_bridge::Exception& e) {
            ROS_ERROR("Could not convert from '%s' to 'bgr8'.", msg->encoding.c_str());
        }
    }
    int main(int argc, char** argv) {
        ros::init(argc, argv, "image_subscriber");
        ros::NodeHandle nh;
        // 创建一个订阅器，接收来自发布器的图像消息
        ros::Subscriber sub = nh.subscribe("/robot1/cam0/rgb/image_raw", 1, imageCallback);
        ros::spin();
        return 0;
    }
