; Auto-generated. Do not edit!


(cl:in-package wheels-srv)


;//! \htmlinclude cmd_set_car_direction_speed-request.msg.html

(cl:defclass <cmd_set_car_direction_speed-request> (roslisp-msg-protocol:ros-message)
  ((nNewDirection
    :reader nNewDirection
    :initarg :nNewDirection
    :type cl:integer
    :initform 0)
   (nNewSpeed
    :reader nNewSpeed
    :initarg :nNewSpeed
    :type cl:integer
    :initform 0))
)

(cl:defclass cmd_set_car_direction_speed-request (<cmd_set_car_direction_speed-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cmd_set_car_direction_speed-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cmd_set_car_direction_speed-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wheels-srv:<cmd_set_car_direction_speed-request> is deprecated: use wheels-srv:cmd_set_car_direction_speed-request instead.")))

(cl:ensure-generic-function 'nNewDirection-val :lambda-list '(m))
(cl:defmethod nNewDirection-val ((m <cmd_set_car_direction_speed-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:nNewDirection-val is deprecated.  Use wheels-srv:nNewDirection instead.")
  (nNewDirection m))

(cl:ensure-generic-function 'nNewSpeed-val :lambda-list '(m))
(cl:defmethod nNewSpeed-val ((m <cmd_set_car_direction_speed-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:nNewSpeed-val is deprecated.  Use wheels-srv:nNewSpeed instead.")
  (nNewSpeed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cmd_set_car_direction_speed-request>) ostream)
  "Serializes a message object of type '<cmd_set_car_direction_speed-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nNewDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nNewDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nNewDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nNewDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nNewSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nNewSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nNewSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nNewSpeed)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cmd_set_car_direction_speed-request>) istream)
  "Deserializes a message object of type '<cmd_set_car_direction_speed-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nNewDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nNewDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nNewDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nNewDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nNewSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nNewSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nNewSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nNewSpeed)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cmd_set_car_direction_speed-request>)))
  "Returns string type for a service object of type '<cmd_set_car_direction_speed-request>"
  "wheels/cmd_set_car_direction_speedRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cmd_set_car_direction_speed-request)))
  "Returns string type for a service object of type 'cmd_set_car_direction_speed-request"
  "wheels/cmd_set_car_direction_speedRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cmd_set_car_direction_speed-request>)))
  "Returns md5sum for a message object of type '<cmd_set_car_direction_speed-request>"
  "837840bb4073141683806c367f33409b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cmd_set_car_direction_speed-request)))
  "Returns md5sum for a message object of type 'cmd_set_car_direction_speed-request"
  "837840bb4073141683806c367f33409b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cmd_set_car_direction_speed-request>)))
  "Returns full string definition for message of type '<cmd_set_car_direction_speed-request>"
  (cl:format cl:nil "uint32 nNewDirection~%uint32 nNewSpeed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cmd_set_car_direction_speed-request)))
  "Returns full string definition for message of type 'cmd_set_car_direction_speed-request"
  (cl:format cl:nil "uint32 nNewDirection~%uint32 nNewSpeed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cmd_set_car_direction_speed-request>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cmd_set_car_direction_speed-request>))
  "Converts a ROS message object to a list"
  (cl:list 'cmd_set_car_direction_speed-request
    (cl:cons ':nNewDirection (nNewDirection msg))
    (cl:cons ':nNewSpeed (nNewSpeed msg))
))
;//! \htmlinclude cmd_set_car_direction_speed-response.msg.html

(cl:defclass <cmd_set_car_direction_speed-response> (roslisp-msg-protocol:ros-message)
  ((nLastDirection
    :reader nLastDirection
    :initarg :nLastDirection
    :type cl:integer
    :initform 0)
   (nLastSpeed
    :reader nLastSpeed
    :initarg :nLastSpeed
    :type cl:integer
    :initform 0)
   (nNewDirection
    :reader nNewDirection
    :initarg :nNewDirection
    :type cl:integer
    :initform 0)
   (nNewSpeed
    :reader nNewSpeed
    :initarg :nNewSpeed
    :type cl:integer
    :initform 0)
   (nRetCode
    :reader nRetCode
    :initarg :nRetCode
    :type cl:integer
    :initform 0))
)

(cl:defclass cmd_set_car_direction_speed-response (<cmd_set_car_direction_speed-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cmd_set_car_direction_speed-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cmd_set_car_direction_speed-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wheels-srv:<cmd_set_car_direction_speed-response> is deprecated: use wheels-srv:cmd_set_car_direction_speed-response instead.")))

(cl:ensure-generic-function 'nLastDirection-val :lambda-list '(m))
(cl:defmethod nLastDirection-val ((m <cmd_set_car_direction_speed-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:nLastDirection-val is deprecated.  Use wheels-srv:nLastDirection instead.")
  (nLastDirection m))

(cl:ensure-generic-function 'nLastSpeed-val :lambda-list '(m))
(cl:defmethod nLastSpeed-val ((m <cmd_set_car_direction_speed-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:nLastSpeed-val is deprecated.  Use wheels-srv:nLastSpeed instead.")
  (nLastSpeed m))

(cl:ensure-generic-function 'nNewDirection-val :lambda-list '(m))
(cl:defmethod nNewDirection-val ((m <cmd_set_car_direction_speed-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:nNewDirection-val is deprecated.  Use wheels-srv:nNewDirection instead.")
  (nNewDirection m))

(cl:ensure-generic-function 'nNewSpeed-val :lambda-list '(m))
(cl:defmethod nNewSpeed-val ((m <cmd_set_car_direction_speed-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:nNewSpeed-val is deprecated.  Use wheels-srv:nNewSpeed instead.")
  (nNewSpeed m))

(cl:ensure-generic-function 'nRetCode-val :lambda-list '(m))
(cl:defmethod nRetCode-val ((m <cmd_set_car_direction_speed-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-srv:nRetCode-val is deprecated.  Use wheels-srv:nRetCode instead.")
  (nRetCode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cmd_set_car_direction_speed-response>) ostream)
  "Serializes a message object of type '<cmd_set_car_direction_speed-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nLastDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nLastDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nLastDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nLastDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nLastSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nLastSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nLastSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nLastSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nNewDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nNewDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nNewDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nNewDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nNewSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nNewSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nNewSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nNewSpeed)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'nRetCode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cmd_set_car_direction_speed-response>) istream)
  "Deserializes a message object of type '<cmd_set_car_direction_speed-response>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nLastDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nLastDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nLastDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nLastDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nLastSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nLastSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nLastSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nLastSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nNewDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nNewDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nNewDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nNewDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nNewSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nNewSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nNewSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nNewSpeed)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'nRetCode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cmd_set_car_direction_speed-response>)))
  "Returns string type for a service object of type '<cmd_set_car_direction_speed-response>"
  "wheels/cmd_set_car_direction_speedResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cmd_set_car_direction_speed-response)))
  "Returns string type for a service object of type 'cmd_set_car_direction_speed-response"
  "wheels/cmd_set_car_direction_speedResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cmd_set_car_direction_speed-response>)))
  "Returns md5sum for a message object of type '<cmd_set_car_direction_speed-response>"
  "837840bb4073141683806c367f33409b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cmd_set_car_direction_speed-response)))
  "Returns md5sum for a message object of type 'cmd_set_car_direction_speed-response"
  "837840bb4073141683806c367f33409b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cmd_set_car_direction_speed-response>)))
  "Returns full string definition for message of type '<cmd_set_car_direction_speed-response>"
  (cl:format cl:nil "uint32 nLastDirection~%uint32 nLastSpeed~%uint32 nNewDirection~%uint32 nNewSpeed~%int32 nRetCode~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cmd_set_car_direction_speed-response)))
  "Returns full string definition for message of type 'cmd_set_car_direction_speed-response"
  (cl:format cl:nil "uint32 nLastDirection~%uint32 nLastSpeed~%uint32 nNewDirection~%uint32 nNewSpeed~%int32 nRetCode~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cmd_set_car_direction_speed-response>))
  (cl:+ 0
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cmd_set_car_direction_speed-response>))
  "Converts a ROS message object to a list"
  (cl:list 'cmd_set_car_direction_speed-response
    (cl:cons ':nLastDirection (nLastDirection msg))
    (cl:cons ':nLastSpeed (nLastSpeed msg))
    (cl:cons ':nNewDirection (nNewDirection msg))
    (cl:cons ':nNewSpeed (nNewSpeed msg))
    (cl:cons ':nRetCode (nRetCode msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'cmd_set_car_direction_speed)))
  'cmd_set_car_direction_speed-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'cmd_set_car_direction_speed)))
  'cmd_set_car_direction_speed-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cmd_set_car_direction_speed)))
  "Returns string type for a service object of type '<cmd_set_car_direction_speed>"
  "wheels/cmd_set_car_direction_speed")