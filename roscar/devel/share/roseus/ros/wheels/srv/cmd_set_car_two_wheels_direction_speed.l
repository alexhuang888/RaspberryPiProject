;; Auto-generated. Do not edit!


(when (boundp 'wheels::cmd_set_car_two_wheels_direction_speed)
  (if (not (find-package "WHEELS"))
    (make-package "WHEELS"))
  (shadow 'cmd_set_car_two_wheels_direction_speed (find-package "WHEELS")))
(unless (find-package "WHEELS::CMD_SET_CAR_TWO_WHEELS_DIRECTION_SPEED")
  (make-package "WHEELS::CMD_SET_CAR_TWO_WHEELS_DIRECTION_SPEED"))
(unless (find-package "WHEELS::CMD_SET_CAR_TWO_WHEELS_DIRECTION_SPEEDREQUEST")
  (make-package "WHEELS::CMD_SET_CAR_TWO_WHEELS_DIRECTION_SPEEDREQUEST"))
(unless (find-package "WHEELS::CMD_SET_CAR_TWO_WHEELS_DIRECTION_SPEEDRESPONSE")
  (make-package "WHEELS::CMD_SET_CAR_TWO_WHEELS_DIRECTION_SPEEDRESPONSE"))

(in-package "ROS")





(defclass wheels::cmd_set_car_two_wheels_direction_speedRequest
  :super ros::object
  :slots (_nNewLeftDirection _nNewLeftSpeed _nNewRightDirection _nNewRightSpeed ))

(defmethod wheels::cmd_set_car_two_wheels_direction_speedRequest
  (:init
   (&key
    ((:nNewLeftDirection __nNewLeftDirection) 0)
    ((:nNewLeftSpeed __nNewLeftSpeed) 0)
    ((:nNewRightDirection __nNewRightDirection) 0)
    ((:nNewRightSpeed __nNewRightSpeed) 0)
    )
   (send-super :init)
   (setq _nNewLeftDirection (round __nNewLeftDirection))
   (setq _nNewLeftSpeed (round __nNewLeftSpeed))
   (setq _nNewRightDirection (round __nNewRightDirection))
   (setq _nNewRightSpeed (round __nNewRightSpeed))
   self)
  (:nNewLeftDirection
   (&optional __nNewLeftDirection)
   (if __nNewLeftDirection (setq _nNewLeftDirection __nNewLeftDirection)) _nNewLeftDirection)
  (:nNewLeftSpeed
   (&optional __nNewLeftSpeed)
   (if __nNewLeftSpeed (setq _nNewLeftSpeed __nNewLeftSpeed)) _nNewLeftSpeed)
  (:nNewRightDirection
   (&optional __nNewRightDirection)
   (if __nNewRightDirection (setq _nNewRightDirection __nNewRightDirection)) _nNewRightDirection)
  (:nNewRightSpeed
   (&optional __nNewRightSpeed)
   (if __nNewRightSpeed (setq _nNewRightSpeed __nNewRightSpeed)) _nNewRightSpeed)
  (:serialization-length
   ()
   (+
    ;; uint32 _nNewLeftDirection
    4
    ;; uint32 _nNewLeftSpeed
    4
    ;; uint32 _nNewRightDirection
    4
    ;; uint32 _nNewRightSpeed
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _nNewLeftDirection
       (write-long _nNewLeftDirection s)
     ;; uint32 _nNewLeftSpeed
       (write-long _nNewLeftSpeed s)
     ;; uint32 _nNewRightDirection
       (write-long _nNewRightDirection s)
     ;; uint32 _nNewRightSpeed
       (write-long _nNewRightSpeed s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _nNewLeftDirection
     (setq _nNewLeftDirection (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _nNewLeftSpeed
     (setq _nNewLeftSpeed (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _nNewRightDirection
     (setq _nNewRightDirection (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _nNewRightSpeed
     (setq _nNewRightSpeed (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass wheels::cmd_set_car_two_wheels_direction_speedResponse
  :super ros::object
  :slots (_nLastLeftDirection _nLastLeftSpeed _nLastRightDirection _nLastRightSpeed _nNewLeftDirection _nNewLeftSpeed _nNewRightDirection _nNewRightSpeed _nRetCode ))

(defmethod wheels::cmd_set_car_two_wheels_direction_speedResponse
  (:init
   (&key
    ((:nLastLeftDirection __nLastLeftDirection) 0)
    ((:nLastLeftSpeed __nLastLeftSpeed) 0)
    ((:nLastRightDirection __nLastRightDirection) 0)
    ((:nLastRightSpeed __nLastRightSpeed) 0)
    ((:nNewLeftDirection __nNewLeftDirection) 0)
    ((:nNewLeftSpeed __nNewLeftSpeed) 0)
    ((:nNewRightDirection __nNewRightDirection) 0)
    ((:nNewRightSpeed __nNewRightSpeed) 0)
    ((:nRetCode __nRetCode) 0)
    )
   (send-super :init)
   (setq _nLastLeftDirection (round __nLastLeftDirection))
   (setq _nLastLeftSpeed (round __nLastLeftSpeed))
   (setq _nLastRightDirection (round __nLastRightDirection))
   (setq _nLastRightSpeed (round __nLastRightSpeed))
   (setq _nNewLeftDirection (round __nNewLeftDirection))
   (setq _nNewLeftSpeed (round __nNewLeftSpeed))
   (setq _nNewRightDirection (round __nNewRightDirection))
   (setq _nNewRightSpeed (round __nNewRightSpeed))
   (setq _nRetCode (round __nRetCode))
   self)
  (:nLastLeftDirection
   (&optional __nLastLeftDirection)
   (if __nLastLeftDirection (setq _nLastLeftDirection __nLastLeftDirection)) _nLastLeftDirection)
  (:nLastLeftSpeed
   (&optional __nLastLeftSpeed)
   (if __nLastLeftSpeed (setq _nLastLeftSpeed __nLastLeftSpeed)) _nLastLeftSpeed)
  (:nLastRightDirection
   (&optional __nLastRightDirection)
   (if __nLastRightDirection (setq _nLastRightDirection __nLastRightDirection)) _nLastRightDirection)
  (:nLastRightSpeed
   (&optional __nLastRightSpeed)
   (if __nLastRightSpeed (setq _nLastRightSpeed __nLastRightSpeed)) _nLastRightSpeed)
  (:nNewLeftDirection
   (&optional __nNewLeftDirection)
   (if __nNewLeftDirection (setq _nNewLeftDirection __nNewLeftDirection)) _nNewLeftDirection)
  (:nNewLeftSpeed
   (&optional __nNewLeftSpeed)
   (if __nNewLeftSpeed (setq _nNewLeftSpeed __nNewLeftSpeed)) _nNewLeftSpeed)
  (:nNewRightDirection
   (&optional __nNewRightDirection)
   (if __nNewRightDirection (setq _nNewRightDirection __nNewRightDirection)) _nNewRightDirection)
  (:nNewRightSpeed
   (&optional __nNewRightSpeed)
   (if __nNewRightSpeed (setq _nNewRightSpeed __nNewRightSpeed)) _nNewRightSpeed)
  (:nRetCode
   (&optional __nRetCode)
   (if __nRetCode (setq _nRetCode __nRetCode)) _nRetCode)
  (:serialization-length
   ()
   (+
    ;; uint32 _nLastLeftDirection
    4
    ;; uint32 _nLastLeftSpeed
    4
    ;; uint32 _nLastRightDirection
    4
    ;; uint32 _nLastRightSpeed
    4
    ;; uint32 _nNewLeftDirection
    4
    ;; uint32 _nNewLeftSpeed
    4
    ;; uint32 _nNewRightDirection
    4
    ;; uint32 _nNewRightSpeed
    4
    ;; int32 _nRetCode
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _nLastLeftDirection
       (write-long _nLastLeftDirection s)
     ;; uint32 _nLastLeftSpeed
       (write-long _nLastLeftSpeed s)
     ;; uint32 _nLastRightDirection
       (write-long _nLastRightDirection s)
     ;; uint32 _nLastRightSpeed
       (write-long _nLastRightSpeed s)
     ;; uint32 _nNewLeftDirection
       (write-long _nNewLeftDirection s)
     ;; uint32 _nNewLeftSpeed
       (write-long _nNewLeftSpeed s)
     ;; uint32 _nNewRightDirection
       (write-long _nNewRightDirection s)
     ;; uint32 _nNewRightSpeed
       (write-long _nNewRightSpeed s)
     ;; int32 _nRetCode
       (write-long _nRetCode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _nLastLeftDirection
     (setq _nLastLeftDirection (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _nLastLeftSpeed
     (setq _nLastLeftSpeed (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _nLastRightDirection
     (setq _nLastRightDirection (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _nLastRightSpeed
     (setq _nLastRightSpeed (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _nNewLeftDirection
     (setq _nNewLeftDirection (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _nNewLeftSpeed
     (setq _nNewLeftSpeed (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _nNewRightDirection
     (setq _nNewRightDirection (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _nNewRightSpeed
     (setq _nNewRightSpeed (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _nRetCode
     (setq _nRetCode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass wheels::cmd_set_car_two_wheels_direction_speed
  :super ros::object
  :slots ())

(setf (get wheels::cmd_set_car_two_wheels_direction_speed :md5sum-) "9128a6c04ba27907a78d99bb5fdac112")
(setf (get wheels::cmd_set_car_two_wheels_direction_speed :datatype-) "wheels/cmd_set_car_two_wheels_direction_speed")
(setf (get wheels::cmd_set_car_two_wheels_direction_speed :request) wheels::cmd_set_car_two_wheels_direction_speedRequest)
(setf (get wheels::cmd_set_car_two_wheels_direction_speed :response) wheels::cmd_set_car_two_wheels_direction_speedResponse)

(defmethod wheels::cmd_set_car_two_wheels_direction_speedRequest
  (:response () (instance wheels::cmd_set_car_two_wheels_direction_speedResponse :init)))

(setf (get wheels::cmd_set_car_two_wheels_direction_speedRequest :md5sum-) "9128a6c04ba27907a78d99bb5fdac112")
(setf (get wheels::cmd_set_car_two_wheels_direction_speedRequest :datatype-) "wheels/cmd_set_car_two_wheels_direction_speedRequest")
(setf (get wheels::cmd_set_car_two_wheels_direction_speedRequest :definition-)
      "uint32 nNewLeftDirection
uint32 nNewLeftSpeed
uint32 nNewRightDirection
uint32 nNewRightSpeed
---
uint32 nLastLeftDirection
uint32 nLastLeftSpeed
uint32 nLastRightDirection
uint32 nLastRightSpeed

uint32 nNewLeftDirection
uint32 nNewLeftSpeed

uint32 nNewRightDirection
uint32 nNewRightSpeed

int32 nRetCode

")

(setf (get wheels::cmd_set_car_two_wheels_direction_speedResponse :md5sum-) "9128a6c04ba27907a78d99bb5fdac112")
(setf (get wheels::cmd_set_car_two_wheels_direction_speedResponse :datatype-) "wheels/cmd_set_car_two_wheels_direction_speedResponse")
(setf (get wheels::cmd_set_car_two_wheels_direction_speedResponse :definition-)
      "uint32 nNewLeftDirection
uint32 nNewLeftSpeed
uint32 nNewRightDirection
uint32 nNewRightSpeed
---
uint32 nLastLeftDirection
uint32 nLastLeftSpeed
uint32 nLastRightDirection
uint32 nLastRightSpeed

uint32 nNewLeftDirection
uint32 nNewLeftSpeed

uint32 nNewRightDirection
uint32 nNewRightSpeed

int32 nRetCode

")



(provide :wheels/cmd_set_car_two_wheels_direction_speed "9128a6c04ba27907a78d99bb5fdac112")


