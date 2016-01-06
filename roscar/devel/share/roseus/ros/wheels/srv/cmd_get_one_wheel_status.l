;; Auto-generated. Do not edit!


(when (boundp 'wheels::cmd_get_one_wheel_status)
  (if (not (find-package "WHEELS"))
    (make-package "WHEELS"))
  (shadow 'cmd_get_one_wheel_status (find-package "WHEELS")))
(unless (find-package "WHEELS::CMD_GET_ONE_WHEEL_STATUS")
  (make-package "WHEELS::CMD_GET_ONE_WHEEL_STATUS"))
(unless (find-package "WHEELS::CMD_GET_ONE_WHEEL_STATUSREQUEST")
  (make-package "WHEELS::CMD_GET_ONE_WHEEL_STATUSREQUEST"))
(unless (find-package "WHEELS::CMD_GET_ONE_WHEEL_STATUSRESPONSE")
  (make-package "WHEELS::CMD_GET_ONE_WHEEL_STATUSRESPONSE"))

(in-package "ROS")





(defclass wheels::cmd_get_one_wheel_statusRequest
  :super ros::object
  :slots (_nWheelID ))

(defmethod wheels::cmd_get_one_wheel_statusRequest
  (:init
   (&key
    ((:nWheelID __nWheelID) 0)
    )
   (send-super :init)
   (setq _nWheelID (round __nWheelID))
   self)
  (:nWheelID
   (&optional __nWheelID)
   (if __nWheelID (setq _nWheelID __nWheelID)) _nWheelID)
  (:serialization-length
   ()
   (+
    ;; uint32 _nWheelID
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _nWheelID
       (write-long _nWheelID s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _nWheelID
     (setq _nWheelID (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass wheels::cmd_get_one_wheel_statusResponse
  :super ros::object
  :slots (_nWheelDirection _nWheelSpeed _nWheelHealthStatus _nRetCode ))

(defmethod wheels::cmd_get_one_wheel_statusResponse
  (:init
   (&key
    ((:nWheelDirection __nWheelDirection) 0)
    ((:nWheelSpeed __nWheelSpeed) 0)
    ((:nWheelHealthStatus __nWheelHealthStatus) 0)
    ((:nRetCode __nRetCode) 0)
    )
   (send-super :init)
   (setq _nWheelDirection (round __nWheelDirection))
   (setq _nWheelSpeed (round __nWheelSpeed))
   (setq _nWheelHealthStatus (round __nWheelHealthStatus))
   (setq _nRetCode (round __nRetCode))
   self)
  (:nWheelDirection
   (&optional __nWheelDirection)
   (if __nWheelDirection (setq _nWheelDirection __nWheelDirection)) _nWheelDirection)
  (:nWheelSpeed
   (&optional __nWheelSpeed)
   (if __nWheelSpeed (setq _nWheelSpeed __nWheelSpeed)) _nWheelSpeed)
  (:nWheelHealthStatus
   (&optional __nWheelHealthStatus)
   (if __nWheelHealthStatus (setq _nWheelHealthStatus __nWheelHealthStatus)) _nWheelHealthStatus)
  (:nRetCode
   (&optional __nRetCode)
   (if __nRetCode (setq _nRetCode __nRetCode)) _nRetCode)
  (:serialization-length
   ()
   (+
    ;; uint32 _nWheelDirection
    4
    ;; uint32 _nWheelSpeed
    4
    ;; uint32 _nWheelHealthStatus
    4
    ;; int32 _nRetCode
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _nWheelDirection
       (write-long _nWheelDirection s)
     ;; uint32 _nWheelSpeed
       (write-long _nWheelSpeed s)
     ;; uint32 _nWheelHealthStatus
       (write-long _nWheelHealthStatus s)
     ;; int32 _nRetCode
       (write-long _nRetCode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _nWheelDirection
     (setq _nWheelDirection (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _nWheelSpeed
     (setq _nWheelSpeed (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _nWheelHealthStatus
     (setq _nWheelHealthStatus (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _nRetCode
     (setq _nRetCode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass wheels::cmd_get_one_wheel_status
  :super ros::object
  :slots ())

(setf (get wheels::cmd_get_one_wheel_status :md5sum-) "d68fceb73ca087ead6d51290a67889fa")
(setf (get wheels::cmd_get_one_wheel_status :datatype-) "wheels/cmd_get_one_wheel_status")
(setf (get wheels::cmd_get_one_wheel_status :request) wheels::cmd_get_one_wheel_statusRequest)
(setf (get wheels::cmd_get_one_wheel_status :response) wheels::cmd_get_one_wheel_statusResponse)

(defmethod wheels::cmd_get_one_wheel_statusRequest
  (:response () (instance wheels::cmd_get_one_wheel_statusResponse :init)))

(setf (get wheels::cmd_get_one_wheel_statusRequest :md5sum-) "d68fceb73ca087ead6d51290a67889fa")
(setf (get wheels::cmd_get_one_wheel_statusRequest :datatype-) "wheels/cmd_get_one_wheel_statusRequest")
(setf (get wheels::cmd_get_one_wheel_statusRequest :definition-)
      "uint32 nWheelID
---
uint32 nWheelDirection
uint32 nWheelSpeed
uint32 nWheelHealthStatus
int32 nRetCode

")

(setf (get wheels::cmd_get_one_wheel_statusResponse :md5sum-) "d68fceb73ca087ead6d51290a67889fa")
(setf (get wheels::cmd_get_one_wheel_statusResponse :datatype-) "wheels/cmd_get_one_wheel_statusResponse")
(setf (get wheels::cmd_get_one_wheel_statusResponse :definition-)
      "uint32 nWheelID
---
uint32 nWheelDirection
uint32 nWheelSpeed
uint32 nWheelHealthStatus
int32 nRetCode

")



(provide :wheels/cmd_get_one_wheel_status "d68fceb73ca087ead6d51290a67889fa")


