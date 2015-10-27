;; Auto-generated. Do not edit!


(when (boundp 'wheels::wheels_status)
  (if (not (find-package "WHEELS"))
    (make-package "WHEELS"))
  (shadow 'wheels_status (find-package "WHEELS")))
(unless (find-package "WHEELS::WHEELS_STATUS")
  (make-package "WHEELS::WHEELS_STATUS"))

(in-package "ROS")
;;//! \htmlinclude wheels_status.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass wheels::wheels_status
  :super ros::object
  :slots (_header _nRightWheelHealthStatus _nRightWheelDirection _nRightWheelSpeed _nLeftWheelHealthStatus _nLeftWheelDirection _nLeftWheelSpeed ))

(defmethod wheels::wheels_status
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:nRightWheelHealthStatus __nRightWheelHealthStatus) 0)
    ((:nRightWheelDirection __nRightWheelDirection) 0)
    ((:nRightWheelSpeed __nRightWheelSpeed) 0)
    ((:nLeftWheelHealthStatus __nLeftWheelHealthStatus) 0)
    ((:nLeftWheelDirection __nLeftWheelDirection) 0)
    ((:nLeftWheelSpeed __nLeftWheelSpeed) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _nRightWheelHealthStatus (round __nRightWheelHealthStatus))
   (setq _nRightWheelDirection (round __nRightWheelDirection))
   (setq _nRightWheelSpeed (round __nRightWheelSpeed))
   (setq _nLeftWheelHealthStatus (round __nLeftWheelHealthStatus))
   (setq _nLeftWheelDirection (round __nLeftWheelDirection))
   (setq _nLeftWheelSpeed (round __nLeftWheelSpeed))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:nRightWheelHealthStatus
   (&optional __nRightWheelHealthStatus)
   (if __nRightWheelHealthStatus (setq _nRightWheelHealthStatus __nRightWheelHealthStatus)) _nRightWheelHealthStatus)
  (:nRightWheelDirection
   (&optional __nRightWheelDirection)
   (if __nRightWheelDirection (setq _nRightWheelDirection __nRightWheelDirection)) _nRightWheelDirection)
  (:nRightWheelSpeed
   (&optional __nRightWheelSpeed)
   (if __nRightWheelSpeed (setq _nRightWheelSpeed __nRightWheelSpeed)) _nRightWheelSpeed)
  (:nLeftWheelHealthStatus
   (&optional __nLeftWheelHealthStatus)
   (if __nLeftWheelHealthStatus (setq _nLeftWheelHealthStatus __nLeftWheelHealthStatus)) _nLeftWheelHealthStatus)
  (:nLeftWheelDirection
   (&optional __nLeftWheelDirection)
   (if __nLeftWheelDirection (setq _nLeftWheelDirection __nLeftWheelDirection)) _nLeftWheelDirection)
  (:nLeftWheelSpeed
   (&optional __nLeftWheelSpeed)
   (if __nLeftWheelSpeed (setq _nLeftWheelSpeed __nLeftWheelSpeed)) _nLeftWheelSpeed)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint32 _nRightWheelHealthStatus
    4
    ;; uint32 _nRightWheelDirection
    4
    ;; uint32 _nRightWheelSpeed
    4
    ;; uint32 _nLeftWheelHealthStatus
    4
    ;; uint32 _nLeftWheelDirection
    4
    ;; uint32 _nLeftWheelSpeed
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint32 _nRightWheelHealthStatus
       (write-long _nRightWheelHealthStatus s)
     ;; uint32 _nRightWheelDirection
       (write-long _nRightWheelDirection s)
     ;; uint32 _nRightWheelSpeed
       (write-long _nRightWheelSpeed s)
     ;; uint32 _nLeftWheelHealthStatus
       (write-long _nLeftWheelHealthStatus s)
     ;; uint32 _nLeftWheelDirection
       (write-long _nLeftWheelDirection s)
     ;; uint32 _nLeftWheelSpeed
       (write-long _nLeftWheelSpeed s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint32 _nRightWheelHealthStatus
     (setq _nRightWheelHealthStatus (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _nRightWheelDirection
     (setq _nRightWheelDirection (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _nRightWheelSpeed
     (setq _nRightWheelSpeed (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _nLeftWheelHealthStatus
     (setq _nLeftWheelHealthStatus (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _nLeftWheelDirection
     (setq _nLeftWheelDirection (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _nLeftWheelSpeed
     (setq _nLeftWheelSpeed (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get wheels::wheels_status :md5sum-) "e9e1eea3ebd2a2cbb068d478af7927a1")
(setf (get wheels::wheels_status :datatype-) "wheels/wheels_status")
(setf (get wheels::wheels_status :definition-)
      "Header header
uint32 nRightWheelHealthStatus
uint32 nRightWheelDirection
uint32 nRightWheelSpeed
uint32 nLeftWheelHealthStatus
uint32 nLeftWheelDirection
uint32 nLeftWheelSpeed


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
# 0: no frame
# 1: global frame
string frame_id

")



(provide :wheels/wheels_status "e9e1eea3ebd2a2cbb068d478af7927a1")


