; Auto-generated. Do not edit!


(cl:in-package ORB_SLAM3-msg)


;//! \htmlinclude pclpos.msg.html

(cl:defclass <pclpos> (roslisp-msg-protocol:ros-message)
  ((pcl
    :reader pcl
    :initarg :pcl
    :type sensor_msgs-msg:PointCloud2
    :initform (cl:make-instance 'sensor_msgs-msg:PointCloud2)))
)

(cl:defclass pclpos (<pclpos>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <pclpos>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'pclpos)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ORB_SLAM3-msg:<pclpos> is deprecated: use ORB_SLAM3-msg:pclpos instead.")))

(cl:ensure-generic-function 'pcl-val :lambda-list '(m))
(cl:defmethod pcl-val ((m <pclpos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ORB_SLAM3-msg:pcl-val is deprecated.  Use ORB_SLAM3-msg:pcl instead.")
  (pcl m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <pclpos>) ostream)
  "Serializes a message object of type '<pclpos>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pcl) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <pclpos>) istream)
  "Deserializes a message object of type '<pclpos>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pcl) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<pclpos>)))
  "Returns string type for a message object of type '<pclpos>"
  "ORB_SLAM3/pclpos")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'pclpos)))
  "Returns string type for a message object of type 'pclpos"
  "ORB_SLAM3/pclpos")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<pclpos>)))
  "Returns md5sum for a message object of type '<pclpos>"
  "122508cb294cca80e0e2ebe46a55cace")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'pclpos)))
  "Returns md5sum for a message object of type 'pclpos"
  "122508cb294cca80e0e2ebe46a55cace")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<pclpos>)))
  "Returns full string definition for message of type '<pclpos>"
  (cl:format cl:nil "sensor_msgs/PointCloud2 pcl~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'pclpos)))
  "Returns full string definition for message of type 'pclpos"
  (cl:format cl:nil "sensor_msgs/PointCloud2 pcl~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <pclpos>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pcl))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <pclpos>))
  "Converts a ROS message object to a list"
  (cl:list 'pclpos
    (cl:cons ':pcl (pcl msg))
))
