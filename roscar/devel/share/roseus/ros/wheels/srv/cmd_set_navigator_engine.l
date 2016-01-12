;; Auto-generated. Do not edit!


(when (boundp 'wheels::cmd_set_navigator_engine)
  (if (not (find-package "WHEELS"))
    (make-package "WHEELS"))
  (shadow 'cmd_set_navigator_engine (find-package "WHEELS")))
(unless (find-package "WHEELS::CMD_SET_NAVIGATOR_ENGINE")
  (make-package "WHEELS::CMD_SET_NAVIGATOR_ENGINE"))
(unless (find-package "WHEELS::CMD_SET_NAVIGATOR_ENGINEREQUEST")
  (make-package "WHEELS::CMD_SET_NAVIGATOR_ENGINEREQUEST"))
(unless (find-package "WHEELS::CMD_SET_NAVIGATOR_ENGINERESPONSE")
  (make-package "WHEELS::CMD_SET_NAVIGATOR_ENGINERESPONSE"))

(in-package "ROS")





(defclass wheels::cmd_set_navigator_engineRequest
  :super ros::object
  :slots (_nNewEngineID _strNewEngineDescription ))

(defmethod wheels::cmd_set_navigator_engineRequest
  (:init
   (&key
    ((:nNewEngineID __nNewEngineID) 0)
    ((:strNewEngineDescription __strNewEngineDescription) "")
    )
   (send-super :init)
   (setq _nNewEngineID (round __nNewEngineID))
   (setq _strNewEngineDescription (string __strNewEngineDescription))
   self)
  (:nNewEngineID
   (&optional __nNewEngineID)
   (if __nNewEngineID (setq _nNewEngineID __nNewEngineID)) _nNewEngineID)
  (:strNewEngineDescription
   (&optional __strNewEngineDescription)
   (if __strNewEngineDescription (setq _strNewEngineDescription __strNewEngineDescription)) _strNewEngineDescription)
  (:serialization-length
   ()
   (+
    ;; uint32 _nNewEngineID
    4
    ;; string _strNewEngineDescription
    4 (length _strNewEngineDescription)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _nNewEngineID
       (write-long _nNewEngineID s)
     ;; string _strNewEngineDescription
       (write-long (length _strNewEngineDescription) s) (princ _strNewEngineDescription s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _nNewEngineID
     (setq _nNewEngineID (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _strNewEngineDescription
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _strNewEngineDescription (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass wheels::cmd_set_navigator_engineResponse
  :super ros::object
  :slots (_nLastEngineID _strLastEngineDescription _nActiveEngineID _strActiveEngineDescription _nRetCode ))

(defmethod wheels::cmd_set_navigator_engineResponse
  (:init
   (&key
    ((:nLastEngineID __nLastEngineID) 0)
    ((:strLastEngineDescription __strLastEngineDescription) "")
    ((:nActiveEngineID __nActiveEngineID) 0)
    ((:strActiveEngineDescription __strActiveEngineDescription) "")
    ((:nRetCode __nRetCode) 0)
    )
   (send-super :init)
   (setq _nLastEngineID (round __nLastEngineID))
   (setq _strLastEngineDescription (string __strLastEngineDescription))
   (setq _nActiveEngineID (round __nActiveEngineID))
   (setq _strActiveEngineDescription (string __strActiveEngineDescription))
   (setq _nRetCode (round __nRetCode))
   self)
  (:nLastEngineID
   (&optional __nLastEngineID)
   (if __nLastEngineID (setq _nLastEngineID __nLastEngineID)) _nLastEngineID)
  (:strLastEngineDescription
   (&optional __strLastEngineDescription)
   (if __strLastEngineDescription (setq _strLastEngineDescription __strLastEngineDescription)) _strLastEngineDescription)
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
    ;; uint32 _nLastEngineID
    4
    ;; string _strLastEngineDescription
    4 (length _strLastEngineDescription)
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
     ;; uint32 _nLastEngineID
       (write-long _nLastEngineID s)
     ;; string _strLastEngineDescription
       (write-long (length _strLastEngineDescription) s) (princ _strLastEngineDescription s)
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
   ;; uint32 _nLastEngineID
     (setq _nLastEngineID (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _strLastEngineDescription
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _strLastEngineDescription (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint32 _nActiveEngineID
     (setq _nActiveEngineID (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _strActiveEngineDescription
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _strActiveEngineDescription (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _nRetCode
     (setq _nRetCode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass wheels::cmd_set_navigator_engine
  :super ros::object
  :slots ())

(setf (get wheels::cmd_set_navigator_engine :md5sum-) "8e305c8b095c5860798ff953a1d04b0e")
(setf (get wheels::cmd_set_navigator_engine :datatype-) "wheels/cmd_set_navigator_engine")
(setf (get wheels::cmd_set_navigator_engine :request) wheels::cmd_set_navigator_engineRequest)
(setf (get wheels::cmd_set_navigator_engine :response) wheels::cmd_set_navigator_engineResponse)

(defmethod wheels::cmd_set_navigator_engineRequest
  (:response () (instance wheels::cmd_set_navigator_engineResponse :init)))

(setf (get wheels::cmd_set_navigator_engineRequest :md5sum-) "8e305c8b095c5860798ff953a1d04b0e")
(setf (get wheels::cmd_set_navigator_engineRequest :datatype-) "wheels/cmd_set_navigator_engineRequest")
(setf (get wheels::cmd_set_navigator_engineRequest :definition-)
      "uint32 nNewEngineID
string strNewEngineDescription
---
uint32 nLastEngineID
string strLastEngineDescription
uint32 nActiveEngineID
string strActiveEngineDescription
int32 nRetCode

")

(setf (get wheels::cmd_set_navigator_engineResponse :md5sum-) "8e305c8b095c5860798ff953a1d04b0e")
(setf (get wheels::cmd_set_navigator_engineResponse :datatype-) "wheels/cmd_set_navigator_engineResponse")
(setf (get wheels::cmd_set_navigator_engineResponse :definition-)
      "uint32 nNewEngineID
string strNewEngineDescription
---
uint32 nLastEngineID
string strLastEngineDescription
uint32 nActiveEngineID
string strActiveEngineDescription
int32 nRetCode

")



(provide :wheels/cmd_set_navigator_engine "8e305c8b095c5860798ff953a1d04b0e")


