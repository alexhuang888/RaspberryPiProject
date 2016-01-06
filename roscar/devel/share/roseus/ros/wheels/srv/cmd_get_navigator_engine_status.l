;; Auto-generated. Do not edit!


(when (boundp 'wheels::cmd_get_navigator_engine_status)
  (if (not (find-package "WHEELS"))
    (make-package "WHEELS"))
  (shadow 'cmd_get_navigator_engine_status (find-package "WHEELS")))
(unless (find-package "WHEELS::CMD_GET_NAVIGATOR_ENGINE_STATUS")
  (make-package "WHEELS::CMD_GET_NAVIGATOR_ENGINE_STATUS"))
(unless (find-package "WHEELS::CMD_GET_NAVIGATOR_ENGINE_STATUSREQUEST")
  (make-package "WHEELS::CMD_GET_NAVIGATOR_ENGINE_STATUSREQUEST"))
(unless (find-package "WHEELS::CMD_GET_NAVIGATOR_ENGINE_STATUSRESPONSE")
  (make-package "WHEELS::CMD_GET_NAVIGATOR_ENGINE_STATUSRESPONSE"))

(in-package "ROS")





(defclass wheels::cmd_get_navigator_engine_statusRequest
  :super ros::object
  :slots ())

(defmethod wheels::cmd_get_navigator_engine_statusRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass wheels::cmd_get_navigator_engine_statusResponse
  :super ros::object
  :slots (_nActiveEngineID _strActiveEngineDescription _nRetCode ))

(defmethod wheels::cmd_get_navigator_engine_statusResponse
  (:init
   (&key
    ((:nActiveEngineID __nActiveEngineID) 0)
    ((:strActiveEngineDescription __strActiveEngineDescription) "")
    ((:nRetCode __nRetCode) 0)
    )
   (send-super :init)
   (setq _nActiveEngineID (round __nActiveEngineID))
   (setq _strActiveEngineDescription (string __strActiveEngineDescription))
   (setq _nRetCode (round __nRetCode))
   self)
  (:nActiveEngineID
   (&optional __nActiveEngineID)
   (if __nActiveEngineID (setq _nActiveEngineID __nActiveEngineID)) _nActiveEngineID)
  (:strActiveEngineDescription
   (&optional __strActiveEngineDescription)
   (if __strActiveEngineDescription (setq _strActiveEngineDescription __strActiveEngineDescription)) _strActiveEngineDescription)
  (:nRetCode
   (&optional __nRetCode)
   (if __nRetCode (setq _nRetCode __nRetCode)) _nRetCode)
  (:serialization-length
   ()
   (+
    ;; uint32 _nActiveEngineID
    4
    ;; string _strActiveEngineDescription
    4 (length _strActiveEngineDescription)
    ;; int32 _nRetCode
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _nActiveEngineID
       (write-long _nActiveEngineID s)
     ;; string _strActiveEngineDescription
       (write-long (length _strActiveEngineDescription) s) (princ _strActiveEngineDescription s)
     ;; int32 _nRetCode
       (write-long _nRetCode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _nActiveEngineID
     (setq _nActiveEngineID (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _strActiveEngineDescription
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _strActiveEngineDescription (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _nRetCode
     (setq _nRetCode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass wheels::cmd_get_navigator_engine_status
  :super ros::object
  :slots ())

(setf (get wheels::cmd_get_navigator_engine_status :md5sum-) "6936d01040e4f9f14c640d09de779dbc")
(setf (get wheels::cmd_get_navigator_engine_status :datatype-) "wheels/cmd_get_navigator_engine_status")
(setf (get wheels::cmd_get_navigator_engine_status :request) wheels::cmd_get_navigator_engine_statusRequest)
(setf (get wheels::cmd_get_navigator_engine_status :response) wheels::cmd_get_navigator_engine_statusResponse)

(defmethod wheels::cmd_get_navigator_engine_statusRequest
  (:response () (instance wheels::cmd_get_navigator_engine_statusResponse :init)))

(setf (get wheels::cmd_get_navigator_engine_statusRequest :md5sum-) "6936d01040e4f9f14c640d09de779dbc")
(setf (get wheels::cmd_get_navigator_engine_statusRequest :datatype-) "wheels/cmd_get_navigator_engine_statusRequest")
(setf (get wheels::cmd_get_navigator_engine_statusRequest :definition-)
      "---
uint32 nActiveEngineID
string strActiveEngineDescription
int32 nRetCode

")

(setf (get wheels::cmd_get_navigator_engine_statusResponse :md5sum-) "6936d01040e4f9f14c640d09de779dbc")
(setf (get wheels::cmd_get_navigator_engine_statusResponse :datatype-) "wheels/cmd_get_navigator_engine_statusResponse")
(setf (get wheels::cmd_get_navigator_engine_statusResponse :definition-)
      "---
uint32 nActiveEngineID
string strActiveEngineDescription
int32 nRetCode

")



(provide :wheels/cmd_get_navigator_engine_status "6936d01040e4f9f14c640d09de779dbc")


