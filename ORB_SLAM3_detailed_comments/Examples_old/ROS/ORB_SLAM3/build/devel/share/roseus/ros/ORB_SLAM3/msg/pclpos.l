;; Auto-generated. Do not edit!


(when (boundp 'ORB_SLAM3::pclpos)
  (if (not (find-package "ORB_SLAM3"))
    (make-package "ORB_SLAM3"))
  (shadow 'pclpos (find-package "ORB_SLAM3")))
(unless (find-package "ORB_SLAM3::PCLPOS")
  (make-package "ORB_SLAM3::PCLPOS"))

(in-package "ROS")
;;//! \htmlinclude pclpos.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass ORB_SLAM3::pclpos
  :super ros::object
  :slots (_pcl ))

(defmethod ORB_SLAM3::pclpos
  (:init
   (&key
    ((:pcl __pcl) (instance sensor_msgs::PointCloud2 :init))
    )
   (send-super :init)
   (setq _pcl __pcl)
   self)
  (:pcl
   (&rest __pcl)
   (if (keywordp (car __pcl))
       (send* _pcl __pcl)
     (progn
       (if __pcl (setq _pcl (car __pcl)))
       _pcl)))
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/PointCloud2 _pcl
    (send _pcl :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/PointCloud2 _pcl
       (send _pcl :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/PointCloud2 _pcl
     (send _pcl :deserialize buf ptr-) (incf ptr- (send _pcl :serialization-length))
   ;;
   self)
  )

(setf (get ORB_SLAM3::pclpos :md5sum-) "122508cb294cca80e0e2ebe46a55cace")
(setf (get ORB_SLAM3::pclpos :datatype-) "ORB_SLAM3/pclpos")
(setf (get ORB_SLAM3::pclpos :definition-)
      "sensor_msgs/PointCloud2 pcl

================================================================================
MSG: sensor_msgs/PointCloud2
# This message holds a collection of N-dimensional points, which may
# contain additional information such as normals, intensity, etc. The
# point data is stored as a binary blob, its layout described by the
# contents of the \"fields\" array.

# The point cloud data may be organized 2d (image-like) or 1d
# (unordered). Point clouds organized as 2d images may be produced by
# camera depth sensors such as stereo or time-of-flight.

# Time of sensor data acquisition, and the coordinate frame ID (for 3d
# points).
Header header

# 2D structure of the point cloud. If the cloud is unordered, height is
# 1 and width is the length of the point cloud.
uint32 height
uint32 width

# Describes the channels and their layout in the binary data blob.
PointField[] fields

bool    is_bigendian # Is this data bigendian?
uint32  point_step   # Length of a point in bytes
uint32  row_step     # Length of a row in bytes
uint8[] data         # Actual point data, size is (row_step*height)

bool is_dense        # True if there are no invalid points

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: sensor_msgs/PointField
# This message holds the description of one point entry in the
# PointCloud2 message format.
uint8 INT8    = 1
uint8 UINT8   = 2
uint8 INT16   = 3
uint8 UINT16  = 4
uint8 INT32   = 5
uint8 UINT32  = 6
uint8 FLOAT32 = 7
uint8 FLOAT64 = 8

string name      # Name of field
uint32 offset    # Offset from start of point struct
uint8  datatype  # Datatype enumeration, see above
uint32 count     # How many elements in the field

")



(provide :ORB_SLAM3/pclpos "122508cb294cca80e0e2ebe46a55cace")


