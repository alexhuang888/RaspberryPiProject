; Auto-generated. Do not edit!


(cl:in-package wheels-srv)


;//! \htmlinclude cmd_send_manual_instruction-request.msg.html

(cl:defclass <cmd_send_manual_instruction-request> (roslisp-msg-protocol:ros-message)
  ((nManualInstruction
    :reader nManualInstruction
    :initarg :nManualInstruction
    :type cl:integer
    :initform 0))
)

(cl:defclass cmd_send_manual_instruction-request (<cmd_send_manual_instruction-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cmd_send_manual_instruction-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cmd_send_manual_instruction-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wheels-srv:<cmd_send_manual_instruction-request> is deprecated: use wheels-srv:cmd_send_manual_instruction-request instead.")))

(cl:ensure-generic-function 'nManualInstruction-val :lambda-list '(m))
(cl:defmethod nManualInstruction-val ((m <cmd_send_manual_instruction-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:nManualInstruction-val is deprecated.  Use wheels-srv:nManualInstruction instead.")
  (nManualInstruction m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cmd_send_manual_instruction-request>) ostream)
  "Serializes a message object of type '<cmd_send_manual_instruction-request>"
  (cl:let* ((signed (cl:slot-value msg 'nManualInstruction)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cmd_send_manual_instruction-request>) istream)
  "Deserializes a message object of type '<cmd_send_manual_instruction-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'nManualInstruction) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cmd_send_manual_instruction-request>)))
  "Returns string type for a service object of type '<cmd_send_manual_instruction-request>"
  "wheels/cmd_send_manual_instructionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cmd_send_manual_instruction-request)))
  "Returns string type for a service object of type 'cmd_send_manual_instruction-request"
  "wheels/cmd_send_manual_instructionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cmd_send_manual_instruction-request>)))
  "Returns md5sum for a message object of type '<cmd_send_manual_instruction-request>"
  "9d8ae37d01ae5ea2ce7b0f12181b20fc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cmd_send_manual_instruction-request)))
  "Returns md5sum for a message object of type 'cmd_send_manual_instruction-request"
  "9d8ae37d01ae5ea2ce7b0f12181b20fc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cmd_send_manual_instruction-request>)))
  "Returns full string definition for message of type '<cmd_send_manual_instruction-request>"
  (cl:format cl:nil "int32 nManualInstruction~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cmd_send_manual_instruction-request)))
  "Returns full string definition for message of type 'cmd_send_manual_instruction-request"
  (cl:format cl:nil "int32 nManualInstruction~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cmd_send_manual_instruction-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cmd_send_manual_instruction-request>))
  "Converts a ROS message object to a list"
  (cl:list 'cmd_send_manual_instruction-request
    (cl:cons ':nManualInstruction (nManualInstruction msg))
))
;//! \htmlinclude cmd_send_manual_instruction-response.msg.html

(cl:defclass <cmd_send_manual_instruction-response> (roslisp-msg-protocol:ros-message)
  ((nRetCode
    :reader nRetCode
    :initarg :nRetCode
    :type cl:integer
    :initform 0))
)

(cl:defclass cmd_send_manual_instruction-response (<cmd_send_manual_instruction-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cmd_send_manual_instruction-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cmd_send_manual_instruction-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wheels-srv:<cmd_send_manual_instruction-response> is deprecated: use wheels-srv:cmd_send_manual_instruction-response instead.")))

(cl:ensure-generic-function 'nRetCode-val :lambda-list '(m))
(cl:defmethod nRetCode-val ((m <cmd_send_manual_instruction-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:nRetCode-val is deprecated.  Use wheels-srv:nRetCode instead.")
  (nRetCode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cmd_send_manual_instruction-response>) ostream)
  "Serializes a message object of type '<cmd_send_manual_instruction-response>"
  (cl:let* ((signed (cl:slot-value msg 'nRetCode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cmd_send_manual_instruction-response>) istream)
  "Deserializes a message object of type '<cmd_send_manual_instruction-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'nRetCode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cmd_send_manual_instruction-response>)))
  "Returns string type for a service object of type '<cmd_send_manual_instruction-response>"
  "wheels/cmd_send_manual_instructionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cmd_send_manual_instruction-response)))
  "Returns string type for a service object of type 'cmd_send_manual_instruction-response"
  "wheels/cmd_send_manual_instructionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cmd_send_manual_instruction-response>)))
  "Returns md5sum for a message object of type '<cmd_send_manual_instruction-response>"
  "9d8ae37d01ae5ea2ce7b0f12181b20fc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cmd_send_manual_instruction-response)))
  "Returns md5sum for a message object of type 'cmd_send_manual_instruction-response"
  "9d8ae37d01ae5ea2ce7b0f12181b20fc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cmd_send_manual_instruction-response>)))
  "Returns full string definition for message of type '<cmd_send_manual_instruction-response>"
  (cl:format cl:nil "int32 nRetCode~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cmd_send_manual_instruction-response)))
  "Returns full string definition for message of type 'cmd_send_manual_instruction-response"
  (cl:format cl:nil "int32 nRetCode~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cmd_send_manual_instruction-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cmd_send_manual_instruction-response>))
  "Converts a ROS message object to a list"
  (cl:list 'cmd_send_manual_instruction-response
    (cl:cons ':nRetCode (nRetCode msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'cmd_send_manual_instruction)))
  'cmd_send_manual_instruction-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'cmd_send_manual_instruction)))
  'cmd_send_manual_instruction-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cmd_send_manual_instruction)))
  "Returns string type for a service object of type '<cmd_send_manual_instruction>"
  "wheels/cmd_send_manual_instruction")