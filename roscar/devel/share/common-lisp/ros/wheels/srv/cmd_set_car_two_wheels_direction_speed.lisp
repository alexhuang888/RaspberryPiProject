; Auto-generated. Do not edit!


(cl:in-package wheels-srv)


;//! \htmlinclude cmd_set_car_two_wheels_direction_speed-request.msg.html

(cl:defclass <cmd_set_car_two_wheels_direction_speed-request> (roslisp-msg-protocol:ros-message)
  ((nNewLeftDirection
    :reader nNewLeftDirection
    :initarg :nNewLeftDirection
    :type cl:integer
    :initform 0)
   (nNewLeftSpeed
    :reader nNewLeftSpeed
    :initarg :nNewLeftSpeed
    :type cl:integer
    :initform 0)
   (nNewRightDirection
    :reader nNewRightDirection
    :initarg :nNewRightDirection
    :type cl:integer
    :initform 0)
   (nNewRightSpeed
    :reader nNewRightSpeed
    :initarg :nNewRightSpeed
    :type cl:integer
    :initform 0))
)

(cl:defclass cmd_set_car_two_wheels_direction_speed-request (<cmd_set_car_two_wheels_direction_speed-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cmd_set_car_two_wheels_direction_speed-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cmd_set_car_two_wheels_direction_speed-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wheels-srv:<cmd_set_car_two_wheels_direction_speed-request> is deprecated: use wheels-srv:cmd_set_car_two_wheels_direction_speed-request instead.")))

(cl:ensure-generic-function 'nNewLeftDirection-val :lambda-list '(m))
(cl:defmethod nNewLeftDirection-val ((m <cmd_set_car_two_wheels_direction_speed-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:nNewLeftDirection-val is deprecated.  Use wheels-srv:nNewLeftDirection instead.")
  (nNewLeftDirection m))

(cl:ensure-generic-function 'nNewLeftSpeed-val :lambda-list '(m))
(cl:defmethod nNewLeftSpeed-val ((m <cmd_set_car_two_wheels_direction_speed-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:nNewLeftSpeed-val is deprecated.  Use wheels-srv:nNewLeftSpeed instead.")
  (nNewLeftSpeed m))

(cl:ensure-generic-function 'nNewRightDirection-val :lambda-list '(m))
(cl:defmethod nNewRightDirection-val ((m <cmd_set_car_two_wheels_direction_speed-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:nNewRightDirection-val is deprecated.  Use wheels-srv:nNewRightDirection instead.")
  (nNewRightDirection m))

(cl:ensure-generic-function 'nNewRightSpeed-val :lambda-list '(m))
(cl:defmethod nNewRightSpeed-val ((m <cmd_set_car_two_wheels_direction_speed-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:nNewRightSpeed-val is deprecated.  Use wheels-srv:nNewRightSpeed instead.")
  (nNewRightSpeed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cmd_set_car_two_wheels_direction_speed-request>) ostream)
  "Serializes a message object of type '<cmd_set_car_two_wheels_direction_speed-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nNewLeftDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nNewLeftDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nNewLeftDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nNewLeftDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nNewLeftSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nNewLeftSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nNewLeftSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nNewLeftSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nNewRightDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nNewRightDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nNewRightDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nNewRightDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nNewRightSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nNewRightSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nNewRightSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nNewRightSpeed)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cmd_set_car_two_wheels_direction_speed-request>) istream)
  "Deserializes a message object of type '<cmd_set_car_two_wheels_direction_speed-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nNewLeftDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nNewLeftDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nNewLeftDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nNewLeftDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nNewLeftSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nNewLeftSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nNewLeftSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nNewLeftSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nNewRightDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nNewRightDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nNewRightDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nNewRightDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nNewRightSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nNewRightSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nNewRightSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nNewRightSpeed)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cmd_set_car_two_wheels_direction_speed-request>)))
  "Returns string type for a service object of type '<cmd_set_car_two_wheels_direction_speed-request>"
  "wheels/cmd_set_car_two_wheels_direction_speedRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cmd_set_car_two_wheels_direction_speed-request)))
  "Returns string type for a service object of type 'cmd_set_car_two_wheels_direction_speed-request"
  "wheels/cmd_set_car_two_wheels_direction_speedRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cmd_set_car_two_wheels_direction_speed-request>)))
  "Returns md5sum for a message object of type '<cmd_set_car_two_wheels_direction_speed-request>"
  "9128a6c04ba27907a78d99bb5fdac112")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cmd_set_car_two_wheels_direction_speed-request)))
  "Returns md5sum for a message object of type 'cmd_set_car_two_wheels_direction_speed-request"
  "9128a6c04ba27907a78d99bb5fdac112")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cmd_set_car_two_wheels_direction_speed-request>)))
  "Returns full string definition for message of type '<cmd_set_car_two_wheels_direction_speed-request>"
  (cl:format cl:nil "uint32 nNewLeftDirection~%uint32 nNewLeftSpeed~%uint32 nNewRightDirection~%uint32 nNewRightSpeed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cmd_set_car_two_wheels_direction_speed-request)))
  "Returns full string definition for message of type 'cmd_set_car_two_wheels_direction_speed-request"
  (cl:format cl:nil "uint32 nNewLeftDirection~%uint32 nNewLeftSpeed~%uint32 nNewRightDirection~%uint32 nNewRightSpeed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cmd_set_car_two_wheels_direction_speed-request>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cmd_set_car_two_wheels_direction_speed-request>))
  "Converts a ROS message object to a list"
  (cl:list 'cmd_set_car_two_wheels_direction_speed-request
    (cl:cons ':nNewLeftDirection (nNewLeftDirection msg))
    (cl:cons ':nNewLeftSpeed (nNewLeftSpeed msg))
    (cl:cons ':nNewRightDirection (nNewRightDirection msg))
    (cl:cons ':nNewRightSpeed (nNewRightSpeed msg))
))
;//! \htmlinclude cmd_set_car_two_wheels_direction_speed-response.msg.html

(cl:defclass <cmd_set_car_two_wheels_direction_speed-response> (roslisp-msg-protocol:ros-message)
  ((nLastLeftDirection
    :reader nLastLeftDirection
    :initarg :nLastLeftDirection
    :type cl:integer
    :initform 0)
   (nLastLeftSpeed
    :reader nLastLeftSpeed
    :initarg :nLastLeftSpeed
    :type cl:integer
    :initform 0)
   (nLastRightDirection
    :reader nLastRightDirection
    :initarg :nLastRightDirection
    :type cl:integer
    :initform 0)
   (nLastRightSpeed
    :reader nLastRightSpeed
    :initarg :nLastRightSpeed
    :type cl:integer
    :initform 0)
   (nNewLeftDirection
    :reader nNewLeftDirection
    :initarg :nNewLeftDirection
    :type cl:integer
    :initform 0)
   (nNewLeftSpeed
    :reader nNewLeftSpeed
    :initarg :nNewLeftSpeed
    :type cl:integer
    :initform 0)
   (nNewRightDirection
    :reader nNewRightDirection
    :initarg :nNewRightDirection
    :type cl:integer
    :initform 0)
   (nNewRightSpeed
    :reader nNewRightSpeed
    :initarg :nNewRightSpeed
    :type cl:integer
    :initform 0)
   (nRetCode
    :reader nRetCode
    :initarg :nRetCode
    :type cl:integer
    :initform 0))
)

(cl:defclass cmd_set_car_two_wheels_direction_speed-response (<cmd_set_car_two_wheels_direction_speed-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cmd_set_car_two_wheels_direction_speed-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cmd_set_car_two_wheels_direction_speed-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wheels-srv:<cmd_set_car_two_wheels_direction_speed-response> is deprecated: use wheels-srv:cmd_set_car_two_wheels_direction_speed-response instead.")))

(cl:ensure-generic-function 'nLastLeftDirection-val :lambda-list '(m))
(cl:defmethod nLastLeftDirection-val ((m <cmd_set_car_two_wheels_direction_speed-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:nLastLeftDirection-val is deprecated.  Use wheels-srv:nLastLeftDirection instead.")
  (nLastLeftDirection m))

(cl:ensure-generic-function 'nLastLeftSpeed-val :lambda-list '(m))
(cl:defmethod nLastLeftSpeed-val ((m <cmd_set_car_two_wheels_direction_speed-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:nLastLeftSpeed-val is deprecated.  Use wheels-srv:nLastLeftSpeed instead.")
  (nLastLeftSpeed m))

(cl:ensure-generic-function 'nLastRightDirection-val :lambda-list '(m))
(cl:defmethod nLastRightDirection-val ((m <cmd_set_car_two_wheels_direction_speed-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:nLastRightDirection-val is deprecated.  Use wheels-srv:nLastRightDirection instead.")
  (nLastRightDirection m))

(cl:ensure-generic-function 'nLastRightSpeed-val :lambda-list '(m))
(cl:defmethod nLastRightSpeed-val ((m <cmd_set_car_two_wheels_direction_speed-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:nLastRightSpeed-val is deprecated.  Use wheels-srv:nLastRightSpeed instead.")
  (nLastRightSpeed m))

(cl:ensure-generic-function 'nNewLeftDirection-val :lambda-list '(m))
(cl:defmethod nNewLeftDirection-val ((m <cmd_set_car_two_wheels_direction_speed-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:nNewLeftDirection-val is deprecated.  Use wheels-srv:nNewLeftDirection instead.")
  (nNewLeftDirection m))

(cl:ensure-generic-function 'nNewLeftSpeed-val :lambda-list '(m))
(cl:defmethod nNewLeftSpeed-val ((m <cmd_set_car_two_wheels_direction_speed-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:nNewLeftSpeed-val is deprecated.  Use wheels-srv:nNewLeftSpeed instead.")
  (nNewLeftSpeed m))

(cl:ensure-generic-function 'nNewRightDirection-val :lambda-list '(m))
(cl:defmethod nNewRightDirection-val ((m <cmd_set_car_two_wheels_direction_speed-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:nNewRightDirection-val is deprecated.  Use wheels-srv:nNewRightDirection instead.")
  (nNewRightDirection m))

(cl:ensure-generic-function 'nNewRightSpeed-val :lambda-list '(m))
(cl:defmethod nNewRightSpeed-val ((m <cmd_set_car_two_wheels_direction_speed-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:nNewRightSpeed-val is deprecated.  Use wheels-srv:nNewRightSpeed instead.")
  (nNewRightSpeed m))

(cl:ensure-generic-function 'nRetCode-val :lambda-list '(m))
(cl:defmethod nRetCode-val ((m <cmd_set_car_two_wheels_direction_speed-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:nRetCode-val is deprecated.  Use wheels-srv:nRetCode instead.")
  (nRetCode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cmd_set_car_two_wheels_direction_speed-response>) ostream)
  "Serializes a message object of type '<cmd_set_car_two_wheels_direction_speed-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nLastLeftDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nLastLeftDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nLastLeftDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nLastLeftDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nLastLeftSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nLastLeftSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nLastLeftSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nLastLeftSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nLastRightDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nLastRightDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nLastRightDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nLastRightDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nLastRightSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nLastRightSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nLastRightSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nLastRightSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nNewLeftDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nNewLeftDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nNewLeftDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nNewLeftDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nNewLeftSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nNewLeftSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nNewLeftSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nNewLeftSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nNewRightDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nNewRightDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nNewRightDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nNewRightDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nNewRightSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nNewRightSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nNewRightSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nNewRightSpeed)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'nRetCode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cmd_set_car_two_wheels_direction_speed-response>) istream)
  "Deserializes a message object of type '<cmd_set_car_two_wheels_direction_speed-response>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nLastLeftDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nLastLeftDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nLastLeftDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nLastLeftDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nLastLeftSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nLastLeftSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nLastLeftSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nLastLeftSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nLastRightDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nLastRightDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nLastRightDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nLastRightDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nLastRightSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nLastRightSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nLastRightSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nLastRightSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nNewLeftDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nNewLeftDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nNewLeftDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nNewLeftDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nNewLeftSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nNewLeftSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nNewLeftSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nNewLeftSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nNewRightDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nNewRightDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nNewRightDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nNewRightDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nNewRightSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nNewRightSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nNewRightSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nNewRightSpeed)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'nRetCode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cmd_set_car_two_wheels_direction_speed-response>)))
  "Returns string type for a service object of type '<cmd_set_car_two_wheels_direction_speed-response>"
  "wheels/cmd_set_car_two_wheels_direction_speedResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cmd_set_car_two_wheels_direction_speed-response)))
  "Returns string type for a service object of type 'cmd_set_car_two_wheels_direction_speed-response"
  "wheels/cmd_set_car_two_wheels_direction_speedResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cmd_set_car_two_wheels_direction_speed-response>)))
  "Returns md5sum for a message object of type '<cmd_set_car_two_wheels_direction_speed-response>"
  "9128a6c04ba27907a78d99bb5fdac112")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cmd_set_car_two_wheels_direction_speed-response)))
  "Returns md5sum for a message object of type 'cmd_set_car_two_wheels_direction_speed-response"
  "9128a6c04ba27907a78d99bb5fdac112")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cmd_set_car_two_wheels_direction_speed-response>)))
  "Returns full string definition for message of type '<cmd_set_car_two_wheels_direction_speed-response>"
  (cl:format cl:nil "uint32 nLastLeftDirection~%uint32 nLastLeftSpeed~%uint32 nLastRightDirection~%uint32 nLastRightSpeed~%~%uint32 nNewLeftDirection~%uint32 nNewLeftSpeed~%~%uint32 nNewRightDirection~%uint32 nNewRightSpeed~%~%int32 nRetCode~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cmd_set_car_two_wheels_direction_speed-response)))
  "Returns full string definition for message of type 'cmd_set_car_two_wheels_direction_speed-response"
  (cl:format cl:nil "uint32 nLastLeftDirection~%uint32 nLastLeftSpeed~%uint32 nLastRightDirection~%uint32 nLastRightSpeed~%~%uint32 nNewLeftDirection~%uint32 nNewLeftSpeed~%~%uint32 nNewRightDirection~%uint32 nNewRightSpeed~%~%int32 nRetCode~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cmd_set_car_two_wheels_direction_speed-response>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cmd_set_car_two_wheels_direction_speed-response>))
  "Converts a ROS message object to a list"
  (cl:list 'cmd_set_car_two_wheels_direction_speed-response
    (cl:cons ':nLastLeftDirection (nLastLeftDirection msg))
    (cl:cons ':nLastLeftSpeed (nLastLeftSpeed msg))
    (cl:cons ':nLastRightDirection (nLastRightDirection msg))
    (cl:cons ':nLastRightSpeed (nLastRightSpeed msg))
    (cl:cons ':nNewLeftDirection (nNewLeftDirection msg))
    (cl:cons ':nNewLeftSpeed (nNewLeftSpeed msg))
    (cl:cons ':nNewRightDirection (nNewRightDirection msg))
    (cl:cons ':nNewRightSpeed (nNewRightSpeed msg))
    (cl:cons ':nRetCode (nRetCode msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'cmd_set_car_two_wheels_direction_speed)))
  'cmd_set_car_two_wheels_direction_speed-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'cmd_set_car_two_wheels_direction_speed)))
  'cmd_set_car_two_wheels_direction_speed-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cmd_set_car_two_wheels_direction_speed)))
  "Returns string type for a service object of type '<cmd_set_car_two_wheels_direction_speed>"
  "wheels/cmd_set_car_two_wheels_direction_speed")