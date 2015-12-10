; Auto-generated. Do not edit!


(cl:in-package wheels-srv)


;//! \htmlinclude cmd_get_navigator_status-request.msg.html

(cl:defclass <cmd_get_navigator_status-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass cmd_get_navigator_status-request (<cmd_get_navigator_status-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cmd_get_navigator_status-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cmd_get_navigator_status-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wheels-srv:<cmd_get_navigator_status-request> is deprecated: use wheels-srv:cmd_get_navigator_status-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cmd_get_navigator_status-request>) ostream)
  "Serializes a message object of type '<cmd_get_navigator_status-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cmd_get_navigator_status-request>) istream)
  "Deserializes a message object of type '<cmd_get_navigator_status-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cmd_get_navigator_status-request>)))
  "Returns string type for a service object of type '<cmd_get_navigator_status-request>"
  "wheels/cmd_get_navigator_statusRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cmd_get_navigator_status-request)))
  "Returns string type for a service object of type 'cmd_get_navigator_status-request"
  "wheels/cmd_get_navigator_statusRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cmd_get_navigator_status-request>)))
  "Returns md5sum for a message object of type '<cmd_get_navigator_status-request>"
  "6936d01040e4f9f14c640d09de779dbc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cmd_get_navigator_status-request)))
  "Returns md5sum for a message object of type 'cmd_get_navigator_status-request"
  "6936d01040e4f9f14c640d09de779dbc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cmd_get_navigator_status-request>)))
  "Returns full string definition for message of type '<cmd_get_navigator_status-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cmd_get_navigator_status-request)))
  "Returns full string definition for message of type 'cmd_get_navigator_status-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cmd_get_navigator_status-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cmd_get_navigator_status-request>))
  "Converts a ROS message object to a list"
  (cl:list 'cmd_get_navigator_status-request
))
;//! \htmlinclude cmd_get_navigator_status-response.msg.html

(cl:defclass <cmd_get_navigator_status-response> (roslisp-msg-protocol:ros-message)
  ((nActiveEngineID
    :reader nActiveEngineID
    :initarg :nActiveEngineID
    :type cl:integer
    :initform 0)
   (strActiveEngineDescription
    :reader strActiveEngineDescription
    :initarg :strActiveEngineDescription
    :type cl:string
    :initform "")
   (nRetCode
    :reader nRetCode
    :initarg :nRetCode
    :type cl:integer
    :initform 0))
)

(cl:defclass cmd_get_navigator_status-response (<cmd_get_navigator_status-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cmd_get_navigator_status-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cmd_get_navigator_status-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wheels-srv:<cmd_get_navigator_status-response> is deprecated: use wheels-srv:cmd_get_navigator_status-response instead.")))

(cl:ensure-generic-function 'nActiveEngineID-val :lambda-list '(m))
(cl:defmethod nActiveEngineID-val ((m <cmd_get_navigator_status-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:nActiveEngineID-val is deprecated.  Use wheels-srv:nActiveEngineID instead.")
  (nActiveEngineID m))

(cl:ensure-generic-function 'strActiveEngineDescription-val :lambda-list '(m))
(cl:defmethod strActiveEngineDescription-val ((m <cmd_get_navigator_status-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:strActiveEngineDescription-val is deprecated.  Use wheels-srv:strActiveEngineDescription instead.")
  (strActiveEngineDescription m))

(cl:ensure-generic-function 'nRetCode-val :lambda-list '(m))
(cl:defmethod nRetCode-val ((m <cmd_get_navigator_status-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:nRetCode-val is deprecated.  Use wheels-srv:nRetCode instead.")
  (nRetCode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cmd_get_navigator_status-response>) ostream)
  "Serializes a message object of type '<cmd_get_navigator_status-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nActiveEngineID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nActiveEngineID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nActiveEngineID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nActiveEngineID)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'strActiveEngineDescription))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'strActiveEngineDescription))
  (cl:let* ((signed (cl:slot-value msg 'nRetCode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cmd_get_navigator_status-response>) istream)
  "Deserializes a message object of type '<cmd_get_navigator_status-response>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nActiveEngineID)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nActiveEngineID)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nActiveEngineID)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nActiveEngineID)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'strActiveEngineDescription) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'strActiveEngineDescription) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'nRetCode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cmd_get_navigator_status-response>)))
  "Returns string type for a service object of type '<cmd_get_navigator_status-response>"
  "wheels/cmd_get_navigator_statusResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cmd_get_navigator_status-response)))
  "Returns string type for a service object of type 'cmd_get_navigator_status-response"
  "wheels/cmd_get_navigator_statusResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cmd_get_navigator_status-response>)))
  "Returns md5sum for a message object of type '<cmd_get_navigator_status-response>"
  "6936d01040e4f9f14c640d09de779dbc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cmd_get_navigator_status-response)))
  "Returns md5sum for a message object of type 'cmd_get_navigator_status-response"
  "6936d01040e4f9f14c640d09de779dbc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cmd_get_navigator_status-response>)))
  "Returns full string definition for message of type '<cmd_get_navigator_status-response>"
  (cl:format cl:nil "uint32 nActiveEngineID~%string strActiveEngineDescription~%int32 nRetCode~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cmd_get_navigator_status-response)))
  "Returns full string definition for message of type 'cmd_get_navigator_status-response"
  (cl:format cl:nil "uint32 nActiveEngineID~%string strActiveEngineDescription~%int32 nRetCode~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cmd_get_navigator_status-response>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'strActiveEngineDescription))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cmd_get_navigator_status-response>))
  "Converts a ROS message object to a list"
  (cl:list 'cmd_get_navigator_status-response
    (cl:cons ':nActiveEngineID (nActiveEngineID msg))
    (cl:cons ':strActiveEngineDescription (strActiveEngineDescription msg))
    (cl:cons ':nRetCode (nRetCode msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'cmd_get_navigator_status)))
  'cmd_get_navigator_status-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'cmd_get_navigator_status)))
  'cmd_get_navigator_status-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cmd_get_navigator_status)))
  "Returns string type for a service object of type '<cmd_get_navigator_status>"
  "wheels/cmd_get_navigator_status")