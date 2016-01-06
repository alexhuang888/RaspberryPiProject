;; Auto-generated. Do not edit!


(when (boundp 'wheels::cmd_send_manual_instruction)
  (if (not (find-package "WHEELS"))
    (make-package "WHEELS"))
  (shadow 'cmd_send_manual_instruction (find-package "WHEELS")))
(unless (find-package "WHEELS::CMD_SEND_MANUAL_INSTRUCTION")
  (make-package "WHEELS::CMD_SEND_MANUAL_INSTRUCTION"))
(unless (find-package "WHEELS::CMD_SEND_MANUAL_INSTRUCTIONREQUEST")
  (make-package "WHEELS::CMD_SEND_MANUAL_INSTRUCTIONREQUEST"))
(unless (find-package "WHEELS::CMD_SEND_MANUAL_INSTRUCTIONRESPONSE")
  (make-package "WHEELS::CMD_SEND_MANUAL_INSTRUCTIONRESPONSE"))

(in-package "ROS")





(defclass wheels::cmd_send_manual_instructionRequest
  :super ros::object
  :slots (_nManualInstruction ))

(defmethod wheels::cmd_send_manual_instructionRequest
  (:init
   (&key
    ((:nManualInstruction __nManualInstruction) 0)
    )
   (send-super :init)
   (setq _nManualInstruction (round __nManualInstruction))
   self)
  (:nManualInstruction
   (&optional __nManualInstruction)
   (if __nManualInstruction (setq _nManualInstruction __nManualInstruction)) _nManualInstruction)
  (:serialization-length
   ()
   (+
    ;; int32 _nManualInstruction
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _nManualInstruction
       (write-long _nManualInstruction s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _nManualInstruction
     (setq _nManualInstruction (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass wheels::cmd_send_manual_instructionResponse
  :super ros::object
  :slots (_nRetCode ))

(defmethod wheels::cmd_send_manual_instructionResponse
  (:init
   (&key
    ((:nRetCode __nRetCode) 0)
    )
   (send-super :init)
   (setq _nRetCode (round __nRetCode))
   self)
  (:nRetCode
   (&optional __nRetCode)
   (if __nRetCode (setq _nRetCode __nRetCode)) _nRetCode)
  (:serialization-length
   ()
   (+
    ;; int32 _nRetCode
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _nRetCode
       (write-long _nRetCode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _nRetCode
     (setq _nRetCode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass wheels::cmd_send_manual_instruction
  :super ros::object
  :slots ())

(setf (get wheels::cmd_send_manual_instruction :md5sum-) "9d8ae37d01ae5ea2ce7b0f12181b20fc")
(setf (get wheels::cmd_send_manual_instruction :datatype-) "wheels/cmd_send_manual_instruction")
(setf (get wheels::cmd_send_manual_instruction :request) wheels::cmd_send_manual_instructionRequest)
(setf (get wheels::cmd_send_manual_instruction :response) wheels::cmd_send_manual_instructionResponse)

(defmethod wheels::cmd_send_manual_instructionRequest
  (:response () (instance wheels::cmd_send_manual_instructionResponse :init)))

(setf (get wheels::cmd_send_manual_instructionRequest :md5sum-) "9d8ae37d01ae5ea2ce7b0f12181b20fc")
(setf (get wheels::cmd_send_manual_instructionRequest :datatype-) "wheels/cmd_send_manual_instructionRequest")
(setf (get wheels::cmd_send_manual_instructionRequest :definition-)
      "int32 nManualInstruction
---
int32 nRetCode

")

(setf (get wheels::cmd_send_manual_instructionResponse :md5sum-) "9d8ae37d01ae5ea2ce7b0f12181b20fc")
(setf (get wheels::cmd_send_manual_instructionResponse :datatype-) "wheels/cmd_send_manual_instructionResponse")
(setf (get wheels::cmd_send_manual_instructionResponse :definition-)
      "int32 nManualInstruction
---
int32 nRetCode

")



(provide :wheels/cmd_send_manual_instruction "9d8ae37d01ae5ea2ce7b0f12181b20fc")


