;; Auto-generated. Do not edit!


(when (boundp 'cloud_to_grid::pclpos)
  (if (not (find-package "CLOUD_TO_GRID"))
    (make-package "CLOUD_TO_GRID"))
  (shadow 'pclpos (find-package "CLOUD_TO_GRID")))
(unless (find-package "CLOUD_TO_GRID::PCLPOS")
  (make-package "CLOUD_TO_GRID::PCLPOS"))

(in-package "ROS")
;;//! \htmlinclude pclpos.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass cloud_to_grid::pclpos
  :super ros::object
  :slots (_header _pcl _se3 ))

(defmethod cloud_to_grid::pclpos
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:pcl __pcl) (instance sensor_msgs::PointCloud2 :init))
    ((:se3 __se3) (make-array 16 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _pcl __pcl)
   (setq _se3 __se3)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:pcl
   (&rest __pcl)
   (if (keywordp (car __pcl))
       (send* _pcl __pcl)
     (progn
       (if __pcl (setq _pcl (car __pcl)))
       _pcl)))
  (:se3
   (&optional __se3)
   (if __se3 (setq _se3 __se3)) _se3)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; sensor_msgs/PointCloud2 _pcl
    (send _pcl :serialization-length)
    ;; float64[16] _se3
    (* 8    16)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; sensor_msgs/PointCloud2 _pcl
       (send _pcl :serialize s)
     ;; float64[16] _se3
     (dotimes (i 16)
       (sys::poke (elt _se3 i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; sensor_msgs/PointCloud2 _pcl
     (send _pcl :deserialize buf ptr-) (incf ptr- (send _pcl :serialization-length))
   ;; float64[16] _se3
   (dotimes (i (length _se3))
     (setf (elt _se3 i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;;
   self)
  )

(setf (get cloud_to_grid::pclpos :md5sum-) "f361a9478843e85f6ef1b9d010d86cea")
(setf (get cloud_to_grid::pclpos :datatype-) "cloud_to_grid/pclpos")
(setf (get cloud_to_grid::pclpos :definition-)
      "std_msgs/Header header
sensor_msgs/PointCloud2 pcl
float64[16] se3

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



(provide :cloud_to_grid/pclpos "f361a9478843e85f6ef1b9d010d86cea")


