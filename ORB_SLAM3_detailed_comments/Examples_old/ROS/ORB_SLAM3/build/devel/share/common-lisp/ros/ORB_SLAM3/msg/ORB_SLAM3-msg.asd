
(cl:in-package :asdf)

(defsystem "ORB_SLAM3-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "pclpos" :depends-on ("_package_pclpos"))
    (:file "_package_pclpos" :depends-on ("_package"))
  ))