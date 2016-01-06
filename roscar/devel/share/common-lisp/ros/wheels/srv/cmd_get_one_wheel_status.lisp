; Auto-generated. Do not edit!


(cl:in-package wheels-srv)


;//! \htmlinclude cmd_get_one_wheel_status-request.msg.html

(cl:defclass <cmd_get_one_wheel_status-request> (roslisp-msg-protocol:ros-message)
  ((nWheelID
    :reader nWheelID
    :initarg :nWheelID
    :type cl:integer
    :initform 0))
)

(cl:defclass cmd_get_one_wheel_status-request (<cmd_get_one_wheel_status-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cmd_get_one_wheel_status-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cmd_get_one_wheel_status-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wheels-srv:<cmd_get_one_wheel_status-request> is deprecated: use wheels-srv:cmd_get_one_wheel_status-request instead.")))

(cl:ensure-generic-function 'nWheelID-val :lambda-list '(m))
(cl:defmethod nWheelID-val ((m <cmd_get_one_wheel_status-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:nWheelID-val is deprecated.  Use wheels-srv:nWheelID instead.")
  (nWheelID m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cmd_get_one_wheel_status-request>) ostream)
  "Serializes a message object of type '<cmd_get_one_wheel_status-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nWheelID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nWheelID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nWheelID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nWheelID)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cmd_get_one_wheel_status-request>) istream)
  "Deserializes a message object of type '<cmd_get_one_wheel_status-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nWheelID)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nWheelID)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nWheelID)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nWheelID)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cmd_get_one_wheel_status-request>)))
  "Returns string type for a service object of type '<cmd_get_one_wheel_status-request>"
  "wheels/cmd_get_one_wheel_statusRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cmd_get_one_wheel_status-request)))
  "Returns string type for a service object of type 'cmd_get_one_wheel_status-request"
  "wheels/cmd_get_one_wheel_statusRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cmd_get_one_wheel_status-request>)))
  "Returns md5sum for a message object of type '<cmd_get_one_wheel_status-request>"
  "d68fceb73ca087ead6d51290a67889fa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cmd_get_one_wheel_status-request)))
  "Returns md5sum for a message object of type 'cmd_get_one_wheel_status-request"
  "d68fceb73ca087ead6d51290a67889fa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cmd_get_one_wheel_status-request>)))
  "Returns full string definition for message of type '<cmd_get_one_wheel_status-request>"
  (cl:format cl:nil "uint32 nWheelID~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cmd_get_one_wheel_status-request)))
  "Returns full string definition for message of type 'cmd_get_one_wheel_status-request"
  (cl:format cl:nil "uint32 nWheelID~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cmd_get_one_wheel_status-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cmd_get_one_wheel_status-request>))
  "Converts a ROS message object to a list"
  (cl:list 'cmd_get_one_wheel_status-request
    (cl:cons ':nWheelID (nWheelID msg))
))
;//! \htmlinclude cmd_get_one_wheel_status-response.msg.html

(cl:defclass <cmd_get_one_wheel_status-response> (roslisp-msg-protocol:ros-message)
  ((nWheelDirection
    :reader nWheelDirection
    :initarg :nWheelDirection
    :type cl:integer
    :initform 0)
   (nWheelSpeed
    :reader nWheelSpeed
    :initarg :nWheelSpeed
    :type cl:integer
    :initform 0)
   (nWheelHealthStatus
    :reader nWheelHealthStatus
    :initarg :nWheelHealthStatus
    :type cl:integer
    :initform 0)
   (nRetCode
    :reader nRetCode
    :initarg :nRetCode
    :type cl:integer
    :initform 0))
)

(cl:defclass cmd_get_one_wheel_status-response (<cmd_get_one_wheel_status-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cmd_get_one_wheel_status-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cmd_get_one_wheel_status-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wheels-srv:<cmd_get_one_wheel_status-response> is deprecated: use wheels-srv:cmd_get_one_wheel_status-response instead.")))

(cl:ensure-generic-function 'nWheelDirection-val :lambda-list '(m))
(cl:defmethod nWheelDirection-val ((m <cmd_get_one_wheel_status-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:nWheelDirection-val is deprecated.  Use wheels-srv:nWheelDirection instead.")
  (nWheelDirection m))

(cl:ensure-generic-function 'nWheelSpeed-val :lambda-list '(m))
(cl:defmethod nWheelSpeed-val ((m <cmd_get_one_wheel_status-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:nWheelSpeed-val is deprecated.  Use wheels-srv:nWheelSpeed instead.")
  (nWheelSpeed m))

(cl:ensure-generic-function 'nWheelHealthStatus-val :lambda-list '(m))
(cl:defmethod nWheelHealthStatus-val ((m <cmd_get_one_wheel_status-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:nWheelHealthStatus-val is deprecated.  Use wheels-srv:nWheelHealthStatus instead.")
  (nWheelHealthStatus m))

(cl:ensure-generic-function 'nRetCode-val :lambda-list '(m))
(cl:defmethod nRetCode-val ((m <cmd_get_one_wheel_status-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:nRetCode-val is deprecated.  Use wheels-srv:nRetCode instead.")
  (nRetCode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cmd_get_one_wheel_status-response>) ostream)
  "Serializes a message object of type '<cmd_get_one_wheel_status-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nWheelDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nWheelDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nWheelDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nWheelDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nWheelSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nWheelSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nWheelSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nWheelSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nWheelHealthStatus)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nWheelHealthStatus)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nWheelHealthStatus)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nWheelHealthStatus)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'nRetCode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cmd_get_one_wheel_status-response>) istream)
  "Deserializes a message object of type '<cmd_get_one_wheel_status-response>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nWheelDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nWheelDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nWheelDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nWheelDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nWheelSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nWheelSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nWheelSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nWheelSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nWheelHealthStatus)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nWheelHealthStatus)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nWheelHealthStatus)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nWheelHealthStatus)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'nRetCode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cmd_get_one_wheel_status-response>)))
  "Returns string type for a service object of type '<cmd_get_one_wheel_status-response>"
  "wheels/cmd_get_one_wheel_statusResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cmd_get_one_wheel_status-response)))
  "Returns string type for a service object of type 'cmd_get_one_wheel_status-response"
  "wheels/cmd_get_one_wheel_statusResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cmd_get_one_wheel_status-response>)))
  "Returns md5sum for a message object of type '<cmd_get_one_wheel_status-response>"
  "d68fceb73ca087ead6d51290a67889fa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cmd_get_one_wheel_status-response)))
  "Returns md5sum for a message object of type 'cmd_get_one_wheel_status-response"
  "d68fceb73ca087ead6d51290a67889fa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cmd_get_one_wheel_status-response>)))
  "Returns full string definition for message of type '<cmd_get_one_wheel_status-response>"
  (cl:format cl:nil "uint32 nWheelDirection~%uint32 nWheelSpeed~%uint32 nWheelHealthStatus~%int32 nRetCode~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cmd_get_one_wheel_status-response)))
  "Returns full string definition for message of type 'cmd_get_one_wheel_status-response"
  (cl:format cl:nil "uint32 nWheelDirection~%uint32 nWheelSpeed~%uint32 nWheelHealthStatus~%int32 nRetCode~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cmd_get_one_wheel_status-response>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cmd_get_one_wheel_status-response>))
  "Converts a ROS message object to a list"
  (cl:list 'cmd_get_one_wheel_status-response
    (cl:cons ':nWheelDirection (nWheelDirection msg))
    (cl:cons ':nWheelSpeed (nWheelSpeed msg))
    (cl:cons ':nWheelHealthStatus (nWheelHealthStatus msg))
    (cl:cons ':nRetCode (nRetCode msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'cmd_get_one_wheel_status)))
  'cmd_get_one_wheel_status-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'cmd_get_one_wheel_status)))
  'cmd_get_one_wheel_status-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cmd_get_one_wheel_status)))
  "Returns string type for a service object of type '<cmd_get_one_wheel_status>"
  "wheels/cmd_get_one_wheel_status")