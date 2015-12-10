;; Auto-generated. Do not edit!


(when (boundp 'wheels::navigator_engine_status)
  (if (not (find-package "WHEELS"))
    (make-package "WHEELS"))
  (shadow 'navigator_engine_status (find-package "WHEELS")))
(unless (find-package "WHEELS::NAVIGATOR_ENGINE_STATUS")
  (make-package "WHEELS::NAVIGATOR_ENGINE_STATUS"))

(in-package "ROS")
;;//! \htmlinclude navigator_engine_status.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass wheels::navigator_engine_status
  :super ros::object
  :slots (_header _nActiveEngineID _strActiveEngineDescription ))

(defmethod wheels::navigator_engine_status
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:nActiveEngineID __nActiveEngineID) 0)
    ((:strActiveEngineDescription __strActiveEngineDescription) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _nActiveEngineID (round __nActiveEngineID))
   (setq _strActiveEngineDescription (string __strActiveEngineDescription))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:nActiveEngineID
   (&optional __nActiveEngineID)
   (if __nActiveEngineID (setq _nActiveEngineID __nActiveEngineID)) _nActiveEngineID)
  (:strActiveEngineDescription
   (&optional __strActiveEngineDescription)
   (if __strActiveEngineDescription (setq _strActiveEngineDescription __strActiveEngineDescription)) _strActiveEngineDescription)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint32 _nActiveEngineID
    4
    ;; string _strActiveEngineDescription
    4 (length _strActiveEngineDescription)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint32 _nActiveEngineID
       (write-long _nActiveEngineID s)
     ;; string _strActiveEngineDescription
       (write-long (length _strActiveEngineDescription) s) (princ _strActiveEngineDescription s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint32 _nActiveEngineID
     (setq _nActiveEngineID (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _strActiveEngineDescription
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _strActiveEngineDescription (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get wheels::navigator_engine_status :md5sum-) "b58306f136fb7e7ce1f37a683a5ac9f4")
(setf (get wheels::navigator_engine_status :datatype-) "wheels/navigator_engine_status")
(setf (get wheels::navigator_engine_status :definition-)
      "Header header
uint32 nActiveEngineID
string strActiveEngineDescription


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



(provide :wheels/navigator_engine_status "b58306f136fb7e7ce1f37a683a5ac9f4")


