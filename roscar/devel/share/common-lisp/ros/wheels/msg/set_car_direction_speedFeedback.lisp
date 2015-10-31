; Auto-generated. Do not edit!


(cl:in-package wheels-msg)


;//! \htmlinclude set_car_direction_speedFeedback.msg.html

(cl:defclass <set_car_direction_speedFeedback> (roslisp-msg-protocol:ros-message)
  ((nCurrentDirection
    :reader nCurrentDirection
    :initarg :nCurrentDirection
    :type cl:integer
    :initform 0)
   (nCurrentSpeed
    :reader nCurrentSpeed
    :initarg :nCurrentSpeed
    :type cl:integer
    :initform 0)
   (nRetCode
    :reader nRetCode
    :initarg :nRetCode
    :type cl:integer
    :initform 0))
)

(cl:defclass set_car_direction_speedFeedback (<set_car_direction_speedFeedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <set_car_direction_speedFeedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'set_car_direction_speedFeedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wheels-msg:<set_car_direction_speedFeedback> is deprecated: use wheels-msg:set_car_direction_speedFeedback instead.")))

(cl:ensure-generic-function 'nCurrentDirection-val :lambda-list '(m))
(cl:defmethod nCurrentDirection-val ((m <set_car_direction_speedFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-msg:nCurrentDirection-val is deprecated.  Use wheels-msg:nCurrentDirection instead.")
  (nCurrentDirection m))

(cl:ensure-generic-function 'nCurrentSpeed-val :lambda-list '(m))
(cl:defmethod nCurrentSpeed-val ((m <set_car_direction_speedFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-msg:nCurrentSpeed-val is deprecated.  Use wheels-msg:nCurrentSpeed instead.")
  (nCurrentSpeed m))

(cl:ensure-generic-function 'nRetCode-val :lambda-list '(m))
(cl:defmethod nRetCode-val ((m <set_car_direction_speedFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-msg:nRetCode-val is deprecated.  Use wheels-msg:nRetCode instead.")
  (nRetCode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <set_car_direction_speedFeedback>) ostream)
  "Serializes a message object of type '<set_car_direction_speedFeedback>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nCurrentDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nCurrentDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nCurrentDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nCurrentDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nCurrentSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nCurrentSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nCurrentSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nCurrentSpeed)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'nRetCode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <set_car_direction_speedFeedback>) istream)
  "Deserializes a message object of type '<set_car_direction_speedFeedback>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nCurrentDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nCurrentDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nCurrentDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nCurrentDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nCurrentSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nCurrentSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nCurrentSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nCurrentSpeed)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'nRetCode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<set_car_direction_speedFeedback>)))
  "Returns string type for a message object of type '<set_car_direction_speedFeedback>"
  "wheels/set_car_direction_speedFeedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'set_car_direction_speedFeedback)))
  "Returns string type for a message object of type 'set_car_direction_speedFeedback"
  "wheels/set_car_direction_speedFeedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<set_car_direction_speedFeedback>)))
  "Returns md5sum for a message object of type '<set_car_direction_speedFeedback>"
  "b0c6e9edd70dc4e3074ed473e625107a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'set_car_direction_speedFeedback)))
  "Returns md5sum for a message object of type 'set_car_direction_speedFeedback"
  "b0c6e9edd70dc4e3074ed473e625107a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<set_car_direction_speedFeedback>)))
  "Returns full string definition for message of type '<set_car_direction_speedFeedback>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#define the feedback message~%uint32 nCurrentDirection~%uint32 nCurrentSpeed~%int32 nRetCode~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'set_car_direction_speedFeedback)))
  "Returns full string definition for message of type 'set_car_direction_speedFeedback"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#define the feedback message~%uint32 nCurrentDirection~%uint32 nCurrentSpeed~%int32 nRetCode~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <set_car_direction_speedFeedback>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <set_car_direction_speedFeedback>))
  "Converts a ROS message object to a list"
  (cl:list 'set_car_direction_speedFeedback
    (cl:cons ':nCurrentDirection (nCurrentDirection msg))
    (cl:cons ':nCurrentSpeed (nCurrentSpeed msg))
    (cl:cons ':nRetCode (nRetCode msg))
))
