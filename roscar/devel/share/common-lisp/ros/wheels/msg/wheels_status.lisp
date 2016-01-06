; Auto-generated. Do not edit!


(cl:in-package wheels-msg)


;//! \htmlinclude wheels_status.msg.html

(cl:defclass <wheels_status> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (nRightWheelHealthStatus
    :reader nRightWheelHealthStatus
    :initarg :nRightWheelHealthStatus
    :type cl:integer
    :initform 0)
   (nRightWheelDirection
    :reader nRightWheelDirection
    :initarg :nRightWheelDirection
    :type cl:integer
    :initform 0)
   (nRightWheelSpeed
    :reader nRightWheelSpeed
    :initarg :nRightWheelSpeed
    :type cl:integer
    :initform 0)
   (nLeftWheelHealthStatus
    :reader nLeftWheelHealthStatus
    :initarg :nLeftWheelHealthStatus
    :type cl:integer
    :initform 0)
   (nLeftWheelDirection
    :reader nLeftWheelDirection
    :initarg :nLeftWheelDirection
    :type cl:integer
    :initform 0)
   (nLeftWheelSpeed
    :reader nLeftWheelSpeed
    :initarg :nLeftWheelSpeed
    :type cl:integer
    :initform 0))
)

(cl:defclass wheels_status (<wheels_status>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <wheels_status>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'wheels_status)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wheels-msg:<wheels_status> is deprecated: use wheels-msg:wheels_status instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <wheels_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-msg:header-val is deprecated.  Use wheels-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'nRightWheelHealthStatus-val :lambda-list '(m))
(cl:defmethod nRightWheelHealthStatus-val ((m <wheels_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-msg:nRightWheelHealthStatus-val is deprecated.  Use wheels-msg:nRightWheelHealthStatus instead.")
  (nRightWheelHealthStatus m))

(cl:ensure-generic-function 'nRightWheelDirection-val :lambda-list '(m))
(cl:defmethod nRightWheelDirection-val ((m <wheels_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-msg:nRightWheelDirection-val is deprecated.  Use wheels-msg:nRightWheelDirection instead.")
  (nRightWheelDirection m))

(cl:ensure-generic-function 'nRightWheelSpeed-val :lambda-list '(m))
(cl:defmethod nRightWheelSpeed-val ((m <wheels_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-msg:nRightWheelSpeed-val is deprecated.  Use wheels-msg:nRightWheelSpeed instead.")
  (nRightWheelSpeed m))

(cl:ensure-generic-function 'nLeftWheelHealthStatus-val :lambda-list '(m))
(cl:defmethod nLeftWheelHealthStatus-val ((m <wheels_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-msg:nLeftWheelHealthStatus-val is deprecated.  Use wheels-msg:nLeftWheelHealthStatus instead.")
  (nLeftWheelHealthStatus m))

(cl:ensure-generic-function 'nLeftWheelDirection-val :lambda-list '(m))
(cl:defmethod nLeftWheelDirection-val ((m <wheels_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-msg:nLeftWheelDirection-val is deprecated.  Use wheels-msg:nLeftWheelDirection instead.")
  (nLeftWheelDirection m))

(cl:ensure-generic-function 'nLeftWheelSpeed-val :lambda-list '(m))
(cl:defmethod nLeftWheelSpeed-val ((m <wheels_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-msg:nLeftWheelSpeed-val is deprecated.  Use wheels-msg:nLeftWheelSpeed instead.")
  (nLeftWheelSpeed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <wheels_status>) ostream)
  "Serializes a message object of type '<wheels_status>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nRightWheelHealthStatus)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nRightWheelHealthStatus)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nRightWheelHealthStatus)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nRightWheelHealthStatus)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nRightWheelDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nRightWheelDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nRightWheelDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nRightWheelDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nRightWheelSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nRightWheelSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nRightWheelSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nRightWheelSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nLeftWheelHealthStatus)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nLeftWheelHealthStatus)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nLeftWheelHealthStatus)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nLeftWheelHealthStatus)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nLeftWheelDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nLeftWheelDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nLeftWheelDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nLeftWheelDirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nLeftWheelSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nLeftWheelSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nLeftWheelSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nLeftWheelSpeed)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <wheels_status>) istream)
  "Deserializes a message object of type '<wheels_status>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nRightWheelHealthStatus)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nRightWheelHealthStatus)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nRightWheelHealthStatus)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nRightWheelHealthStatus)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nRightWheelDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nRightWheelDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nRightWheelDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nRightWheelDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nRightWheelSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nRightWheelSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nRightWheelSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nRightWheelSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nLeftWheelHealthStatus)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nLeftWheelHealthStatus)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nLeftWheelHealthStatus)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nLeftWheelHealthStatus)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nLeftWheelDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nLeftWheelDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nLeftWheelDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nLeftWheelDirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nLeftWheelSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nLeftWheelSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nLeftWheelSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nLeftWheelSpeed)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<wheels_status>)))
  "Returns string type for a message object of type '<wheels_status>"
  "wheels/wheels_status")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'wheels_status)))
  "Returns string type for a message object of type 'wheels_status"
  "wheels/wheels_status")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<wheels_status>)))
  "Returns md5sum for a message object of type '<wheels_status>"
  "e9e1eea3ebd2a2cbb068d478af7927a1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'wheels_status)))
  "Returns md5sum for a message object of type 'wheels_status"
  "e9e1eea3ebd2a2cbb068d478af7927a1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<wheels_status>)))
  "Returns full string definition for message of type '<wheels_status>"
  (cl:format cl:nil "Header header~%uint32 nRightWheelHealthStatus~%uint32 nRightWheelDirection~%uint32 nRightWheelSpeed~%uint32 nLeftWheelHealthStatus~%uint32 nLeftWheelDirection~%uint32 nLeftWheelSpeed~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'wheels_status)))
  "Returns full string definition for message of type 'wheels_status"
  (cl:format cl:nil "Header header~%uint32 nRightWheelHealthStatus~%uint32 nRightWheelDirection~%uint32 nRightWheelSpeed~%uint32 nLeftWheelHealthStatus~%uint32 nLeftWheelDirection~%uint32 nLeftWheelSpeed~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <wheels_status>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <wheels_status>))
  "Converts a ROS message object to a list"
  (cl:list 'wheels_status
    (cl:cons ':header (header msg))
    (cl:cons ':nRightWheelHealthStatus (nRightWheelHealthStatus msg))
    (cl:cons ':nRightWheelDirection (nRightWheelDirection msg))
    (cl:cons ':nRightWheelSpeed (nRightWheelSpeed msg))
    (cl:cons ':nLeftWheelHealthStatus (nLeftWheelHealthStatus msg))
    (cl:cons ':nLeftWheelDirection (nLeftWheelDirection msg))
    (cl:cons ':nLeftWheelSpeed (nLeftWheelSpeed msg))
))
