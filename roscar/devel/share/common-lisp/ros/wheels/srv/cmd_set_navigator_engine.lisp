; Auto-generated. Do not edit!


(cl:in-package wheels-srv)


;//! \htmlinclude cmd_set_navigator_engine-request.msg.html

(cl:defclass <cmd_set_navigator_engine-request> (roslisp-msg-protocol:ros-message)
  ((nNewEngineID
    :reader nNewEngineID
    :initarg :nNewEngineID
    :type cl:integer
    :initform 0)
   (strNewEngineDescription
    :reader strNewEngineDescription
    :initarg :strNewEngineDescription
    :type cl:string
    :initform ""))
)

(cl:defclass cmd_set_navigator_engine-request (<cmd_set_navigator_engine-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cmd_set_navigator_engine-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cmd_set_navigator_engine-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wheels-srv:<cmd_set_navigator_engine-request> is deprecated: use wheels-srv:cmd_set_navigator_engine-request instead.")))

(cl:ensure-generic-function 'nNewEngineID-val :lambda-list '(m))
(cl:defmethod nNewEngineID-val ((m <cmd_set_navigator_engine-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:nNewEngineID-val is deprecated.  Use wheels-srv:nNewEngineID instead.")
  (nNewEngineID m))

(cl:ensure-generic-function 'strNewEngineDescription-val :lambda-list '(m))
(cl:defmethod strNewEngineDescription-val ((m <cmd_set_navigator_engine-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:strNewEngineDescription-val is deprecated.  Use wheels-srv:strNewEngineDescription instead.")
  (strNewEngineDescription m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cmd_set_navigator_engine-request>) ostream)
  "Serializes a message object of type '<cmd_set_navigator_engine-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nNewEngineID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nNewEngineID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nNewEngineID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nNewEngineID)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'strNewEngineDescription))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'strNewEngineDescription))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cmd_set_navigator_engine-request>) istream)
  "Deserializes a message object of type '<cmd_set_navigator_engine-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nNewEngineID)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nNewEngineID)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nNewEngineID)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nNewEngineID)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'strNewEngineDescription) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'strNewEngineDescription) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cmd_set_navigator_engine-request>)))
  "Returns string type for a service object of type '<cmd_set_navigator_engine-request>"
  "wheels/cmd_set_navigator_engineRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cmd_set_navigator_engine-request)))
  "Returns string type for a service object of type 'cmd_set_navigator_engine-request"
  "wheels/cmd_set_navigator_engineRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cmd_set_navigator_engine-request>)))
  "Returns md5sum for a message object of type '<cmd_set_navigator_engine-request>"
  "8e305c8b095c5860798ff953a1d04b0e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cmd_set_navigator_engine-request)))
  "Returns md5sum for a message object of type 'cmd_set_navigator_engine-request"
  "8e305c8b095c5860798ff953a1d04b0e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cmd_set_navigator_engine-request>)))
  "Returns full string definition for message of type '<cmd_set_navigator_engine-request>"
  (cl:format cl:nil "uint32 nNewEngineID~%string strNewEngineDescription~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cmd_set_navigator_engine-request)))
  "Returns full string definition for message of type 'cmd_set_navigator_engine-request"
  (cl:format cl:nil "uint32 nNewEngineID~%string strNewEngineDescription~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cmd_set_navigator_engine-request>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'strNewEngineDescription))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cmd_set_navigator_engine-request>))
  "Converts a ROS message object to a list"
  (cl:list 'cmd_set_navigator_engine-request
    (cl:cons ':nNewEngineID (nNewEngineID msg))
    (cl:cons ':strNewEngineDescription (strNewEngineDescription msg))
))
;//! \htmlinclude cmd_set_navigator_engine-response.msg.html

(cl:defclass <cmd_set_navigator_engine-response> (roslisp-msg-protocol:ros-message)
  ((nLastEngineID
    :reader nLastEngineID
    :initarg :nLastEngineID
    :type cl:integer
    :initform 0)
   (strLastEngineDescription
    :reader strLastEngineDescription
    :initarg :strLastEngineDescription
    :type cl:string
    :initform "")
   (nActiveEngineID
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

(cl:defclass cmd_set_navigator_engine-response (<cmd_set_navigator_engine-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cmd_set_navigator_engine-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cmd_set_navigator_engine-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wheels-srv:<cmd_set_navigator_engine-response> is deprecated: use wheels-srv:cmd_set_navigator_engine-response instead.")))

(cl:ensure-generic-function 'nLastEngineID-val :lambda-list '(m))
(cl:defmethod nLastEngineID-val ((m <cmd_set_navigator_engine-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:nLastEngineID-val is deprecated.  Use wheels-srv:nLastEngineID instead.")
  (nLastEngineID m))

(cl:ensure-generic-function 'strLastEngineDescription-val :lambda-list '(m))
(cl:defmethod strLastEngineDescription-val ((m <cmd_set_navigator_engine-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:strLastEngineDescription-val is deprecated.  Use wheels-srv:strLastEngineDescription instead.")
  (strLastEngineDescription m))

(cl:ensure-generic-function 'nActiveEngineID-val :lambda-list '(m))
(cl:defmethod nActiveEngineID-val ((m <cmd_set_navigator_engine-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:nActiveEngineID-val is deprecated.  Use wheels-srv:nActiveEngineID instead.")
  (nActiveEngineID m))

(cl:ensure-generic-function 'strActiveEngineDescription-val :lambda-list '(m))
(cl:defmethod strActiveEngineDescription-val ((m <cmd_set_navigator_engine-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:strActiveEngineDescription-val is deprecated.  Use wheels-srv:strActiveEngineDescription instead.")
  (strActiveEngineDescription m))

(cl:ensure-generic-function 'nRetCode-val :lambda-list '(m))
(cl:defmethod nRetCode-val ((m <cmd_set_navigator_engine-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:nRetCode-val is deprecated.  Use wheels-srv:nRetCode instead.")
  (nRetCode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cmd_set_navigator_engine-response>) ostream)
  "Serializes a message object of type '<cmd_set_navigator_engine-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nLastEngineID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nLastEngineID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nLastEngineID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nLastEngineID)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'strLastEngineDescription))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'strLastEngineDescription))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cmd_set_navigator_engine-response>) istream)
  "Deserializes a message object of type '<cmd_set_navigator_engine-response>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nLastEngineID)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nLastEngineID)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nLastEngineID)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nLastEngineID)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'strLastEngineDescription) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'strLastEngineDescription) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cmd_set_navigator_engine-response>)))
  "Returns string type for a service object of type '<cmd_set_navigator_engine-response>"
  "wheels/cmd_set_navigator_engineResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cmd_set_navigator_engine-response)))
  "Returns string type for a service object of type 'cmd_set_navigator_engine-response"
  "wheels/cmd_set_navigator_engineResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cmd_set_navigator_engine-response>)))
  "Returns md5sum for a message object of type '<cmd_set_navigator_engine-response>"
  "8e305c8b095c5860798ff953a1d04b0e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cmd_set_navigator_engine-response)))
  "Returns md5sum for a message object of type 'cmd_set_navigator_engine-response"
  "8e305c8b095c5860798ff953a1d04b0e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cmd_set_navigator_engine-response>)))
  "Returns full string definition for message of type '<cmd_set_navigator_engine-response>"
  (cl:format cl:nil "uint32 nLastEngineID~%string strLastEngineDescription~%uint32 nActiveEngineID~%string strActiveEngineDescription~%int32 nRetCode~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cmd_set_navigator_engine-response)))
  "Returns full string definition for message of type 'cmd_set_navigator_engine-response"
  (cl:format cl:nil "uint32 nLastEngineID~%string strLastEngineDescription~%uint32 nActiveEngineID~%string strActiveEngineDescription~%int32 nRetCode~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cmd_set_navigator_engine-response>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'strLastEngineDescription))
     4
     4 (cl:length (cl:slot-value msg 'strActiveEngineDescription))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cmd_set_navigator_engine-response>))
  "Converts a ROS message object to a list"
  (cl:list 'cmd_set_navigator_engine-response
    (cl:cons ':nLastEngineID (nLastEngineID msg))
    (cl:cons ':strLastEngineDescription (strLastEngineDescription msg))
    (cl:cons ':nActiveEngineID (nActiveEngineID msg))
    (cl:cons ':strActiveEngineDescription (strActiveEngineDescription msg))
    (cl:cons ':nRetCode (nRetCode msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'cmd_set_navigator_engine)))
  'cmd_set_navigator_engine-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'cmd_set_navigator_engine)))
  'cmd_set_navigator_engine-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cmd_set_navigator_engine)))
  "Returns string type for a service object of type '<cmd_set_navigator_engine>"
  "wheels/cmd_set_navigator_engine")