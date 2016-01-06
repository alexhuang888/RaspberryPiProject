;; Auto-generated. Do not edit!


(when (boundp 'wheels::cmd_set_car_direction_speed)
  (if (not (find-package "WHEELS"))
    (make-package "WHEELS"))
  (shadow 'cmd_set_car_direction_speed (find-package "WHEELS")))
(unless (find-package "WHEELS::CMD_SET_CAR_DIRECTION_SPEED")
  (make-package "WHEELS::CMD_SET_CAR_DIRECTION_SPEED"))
(unless (find-package "WHEELS::CMD_SET_CAR_DIRECTION_SPEEDREQUEST")
  (make-package "WHEELS::CMD_SET_CAR_DIRECTION_SPEEDREQUEST"))
(unless (find-package "WHEELS::CMD_SET_CAR_DIRECTION_SPEEDRESPONSE")
  (make-package "WHEELS::CMD_SET_CAR_DIRECTION_SPEEDRESPONSE"))

(in-package "ROS")





(defclass wheels::cmd_set_car_direction_speedRequest
  :super ros::object
  :slots (_nNewDirection _nNewSpeed ))

(defmethod wheels::cmd_set_car_direction_speedRequest
  (:init
   (&key
    ((:nNewDirection __nNewDirection) 0)
    ((:nNewSpeed __nNewSpeed) 0)
    )
   (send-super :init)
   (setq _nNewDirection (round __nNewDirection))
   (setq _nNewSpeed (round __nNewSpeed))
   self)
  (:nNewDirection
   (&optional __nNewDirection)
   (if __nNewDirection (setq _nNewDirection __nNewDirection)) _nNewDirection)
  (:nNewSpeed
   (&optional __nNewSpeed)
   (if __nNewSpeed (setq _nNewSpeed __nNewSpeed)) _nNewSpeed)
  (:serialization-length
   ()
   (+
    ;; uint32 _nNewDirection
    4
    ;; uint32 _nNewSpeed
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _nNewDirection
       (write-long _nNewDirection s)
     ;; uint32 _nNewSpeed
       (write-long _nNewSpeed s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _nNewDirection
     (setq _nNewDirection (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _nNewSpeed
     (setq _nNewSpeed (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass wheels::cmd_set_car_direction_speedResponse
  :super ros::object
  :slots (_nLastDirection _nLastSpeed _nNewDirection _nNewSpeed _nRetCode ))

(defmethod wheels::cmd_set_car_direction_speedResponse
  (:init
   (&key
    ((:nLastDirection __nLastDirection) 0)
    ((:nLastSpeed __nLastSpeed) 0)
    ((:nNewDirection __nNewDirection) 0)
    ((:nNewSpeed __nNewSpeed) 0)
    ((:nRetCode __nRetCode) 0)
    )
   (send-super :init)
   (setq _nLastDirection (round __nLastDirection))
   (setq _nLastSpeed (round __nLastSpeed))
   (setq _nNewDirection (round __nNewDirection))
   (setq _nNewSpeed (round __nNewSpeed))
   (setq _nRetCode (round __nRetCode))
   self)
  (:nLastDirection
   (&optional __nLastDirection)
   (if __nLastDirection (setq _nLastDirection __nLastDirection)) _nLastDirection)
  (:nLastSpeed
   (&optional __nLastSpeed)
   (if __nLastSpeed (setq _nLastSpeed __nLastSpeed)) _nLastSpeed)
  (:nNewDirection
   (&optional __nNewDirection)
   (if __nNewDirection (setq _nNewDirection __nNewDirection)) _nNewDirection)
  (:nNewSpeed
   (&optional __nNewSpeed)
   (if __nNewSpeed (setq _nNewSpeed __nNewSpeed)) _nNewSpeed)
  (:nRetCode
   (&optional __nRetCode)
   (if __nRetCode (setq _nRetCode __nRetCode)) _nRetCode)
  (:serialization-length
   ()
   (+
    ;; uint32 _nLastDirection
    4
    ;; uint32 _nLastSpeed
    4
    ;; uint32 _nNewDirection
    4
    ;; uint32 _nNewSpeed
    4
    ;; int32 _nRetCode
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _nLastDirection
       (write-long _nLastDirection s)
     ;; uint32 _nLastSpeed
       (write-long _nLastSpeed s)
     ;; uint32 _nNewDirection
       (write-long _nNewDirection s)
     ;; uint32 _nNewSpeed
       (write-long _nNewSpeed s)
     ;; int32 _nRetCode
       (write-long _nRetCode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _nLastDirection
     (setq _nLastDirection (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _nLastSpeed
     (setq _nLastSpeed (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _nNewDirection
     (setq _nNewDirection (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _nNewSpeed
     (setq _nNewSpeed (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _nRetCode
     (setq _nRetCode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass wheels::cmd_set_car_direction_speed
  :super ros::object
  :slots ())

(setf (get wheels::cmd_set_car_direction_speed :md5sum-) "837840bb4073141683806c367f33409b")
(setf (get wheels::cmd_set_car_direction_speed :datatype-) "wheels/cmd_set_car_direction_speed")
(setf (get wheels::cmd_set_car_direction_speed :request) wheels::cmd_set_car_direction_speedRequest)
(setf (get wheels::cmd_set_car_direction_speed :response) wheels::cmd_set_car_direction_speedResponse)

(defmethod wheels::cmd_set_car_direction_speedRequest
  (:response () (instance wheels::cmd_set_car_direction_speedResponse :init)))

(setf (get wheels::cmd_set_car_direction_speedRequest :md5sum-) "837840bb4073141683806c367f33409b")
(setf (get wheels::cmd_set_car_direction_speedRequest :datatype-) "wheels/cmd_set_car_direction_speedRequest")
(setf (get wheels::cmd_set_car_direction_speedRequest :definition-)
      "uint32 nNewDirection
uint32 nNewSpeed
---
uint32 nLastDirection
uint32 nLastSpeed
uint32 nNewDirection
uint32 nNewSpeed
int32 nRetCode

")

(setf (get wheels::cmd_set_car_direction_speedResponse :md5sum-) "837840bb4073141683806c367f33409b")
(setf (get wheels::cmd_set_car_direction_speedResponse :datatype-) "wheels/cmd_set_car_direction_speedResponse")
(setf (get wheels::cmd_set_car_direction_speedResponse :definition-)
      "uint32 nNewDirection
uint32 nNewSpeed
---
uint32 nLastDirection
uint32 nLastSpeed
uint32 nNewDirection
uint32 nNewSpeed
int32 nRetCode

")



(provide :wheels/cmd_set_car_direction_speed "837840bb4073141683806c367f33409b")


