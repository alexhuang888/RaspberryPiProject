; Auto-generated. Do not edit!


(cl:in-package wheels-msg)


;//! \htmlinclude set_car_direction_speedResult.msg.html

(cl:defclass <set_car_direction_speedResult> (roslisp-msg-protocol:ros-message)
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
   (nRetCode
    :reader nRetCode
    :initarg :nRetCode
    :type cl:integer
    :initform 0))
)

(cl:defclass set_car_direction_speedResult (<set_car_direction_speedResult>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <set_car_direction_speedResult>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'set_car_direction_speedResult)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wheels-msg:<set_car_direction_speedResult> is deprecated: use wheels-msg:set_car_direction_speedResult instead.")))

(cl:ensure-generic-function 'nLastDirection-val :lambda-list '(m))
(cl:defmethod nLastDirection-val ((m <set_car_direction_speedResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-msg:nLastDirection-val is deprecated.  Use wheels-msg:nLastDirection instead.")
  (nLastDirection m))

(cl:ensure-generic-function 'nLastSpeed-val :lambda-list '(m))
(cl:defmethod nLastSpeed-val ((m <set_car_direction_speedResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-msg:nLastSpeed-val is deprecated.  Use wheels-msg:nLastSpeed instead.")
  (nLastSpeed m))

(cl:ensure-generic-function 'nRetCode-val :lambda-list '(m))
(cl:defmethod nRetCode-val ((m <set_car_direction_speedResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-msg:nRetCode-val is deprecated.  Use wheels-msg:nRetCode instead.")
  (nRetCode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <set_car_direction_speedResult>) ostream)
  "Serializes a message object of type '<set_car_direction_speedResult>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nLastDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nLastDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nLastDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nLastDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nLastSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nLastSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nLastSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nLastSpeed)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'nRetCode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <set_car_direction_speedResult>) istream)
  "Deserializes a message object of type '<set_car_direction_speedResult>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nLastDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nLastDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nLastDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nLastDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nLastSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nLastSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nLastSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nLastSpeed)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'nRetCode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<set_car_direction_speedResult>)))
  "Returns string type for a message object of type '<set_car_direction_speedResult>"
  "wheels/set_car_direction_speedResult")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'set_car_direction_speedResult)))
  "Returns string type for a message object of type 'set_car_direction_speedResult"
  "wheels/set_car_direction_speedResult")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<set_car_direction_speedResult>)))
  "Returns md5sum for a message object of type '<set_car_direction_speedResult>"
  "f36ed6452d589afbd1b78ebd54bcb2a7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'set_car_direction_speedResult)))
  "Returns md5sum for a message object of type 'set_car_direction_speedResult"
  "f36ed6452d589afbd1b78ebd54bcb2a7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<set_car_direction_speedResult>)))
  "Returns full string definition for message of type '<set_car_direction_speedResult>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#define the result~%uint32 nLastDirection~%uint32 nLastSpeed~%int32 nRetCode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'set_car_direction_speedResult)))
  "Returns full string definition for message of type 'set_car_direction_speedResult"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#define the result~%uint32 nLastDirection~%uint32 nLastSpeed~%int32 nRetCode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <set_car_direction_speedResult>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <set_car_direction_speedResult>))
  "Converts a ROS message object to a list"
  (cl:list 'set_car_direction_speedResult
    (cl:cons ':nLastDirection (nLastDirection msg))
    (cl:cons ':nLastSpeed (nLastSpeed msg))
    (cl:cons ':nRetCode (nRetCode msg))
))
