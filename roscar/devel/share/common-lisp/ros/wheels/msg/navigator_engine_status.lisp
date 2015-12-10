; Auto-generated. Do not edit!


(cl:in-package wheels-msg)


;//! \htmlinclude navigator_engine_status.msg.html

(cl:defclass <navigator_engine_status> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (nActiveEngineID
    :reader nActiveEngineID
    :initarg :nActiveEngineID
    :type cl:integer
    :initform 0)
   (strActiveEngineDescription
    :reader strActiveEngineDescription
    :initarg :strActiveEngineDescription
    :type cl:string
    :initform ""))
)

(cl:defclass navigator_engine_status (<navigator_engine_status>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <navigator_engine_status>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'navigator_engine_status)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wheels-msg:<navigator_engine_status> is deprecated: use wheels-msg:navigator_engine_status instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <navigator_engine_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-msg:header-val is deprecated.  Use wheels-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'nActiveEngineID-val :lambda-list '(m))
(cl:defmethod nActiveEngineID-val ((m <navigator_engine_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-msg:nActiveEngineID-val is deprecated.  Use wheels-msg:nActiveEngineID instead.")
  (nActiveEngineID m))

(cl:ensure-generic-function 'strActiveEngineDescription-val :lambda-list '(m))
(cl:defmethod strActiveEngineDescription-val ((m <navigator_engine_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheels-msg:strActiveEngineDescription-val is deprecated.  Use wheels-msg:strActiveEngineDescription instead.")
  (strActiveEngineDescription m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <navigator_engine_status>) ostream)
  "Serializes a message object of type '<navigator_engine_status>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
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
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <navigator_engine_status>) istream)
  "Deserializes a message object of type '<navigator_engine_status>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
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
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<navigator_engine_status>)))
  "Returns string type for a message object of type '<navigator_engine_status>"
  "wheels/navigator_engine_status")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'navigator_engine_status)))
  "Returns string type for a message object of type 'navigator_engine_status"
  "wheels/navigator_engine_status")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<navigator_engine_status>)))
  "Returns md5sum for a message object of type '<navigator_engine_status>"
  "b58306f136fb7e7ce1f37a683a5ac9f4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'navigator_engine_status)))
  "Returns md5sum for a message object of type 'navigator_engine_status"
  "b58306f136fb7e7ce1f37a683a5ac9f4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<navigator_engine_status>)))
  "Returns full string definition for message of type '<navigator_engine_status>"
  (cl:format cl:nil "Header header~%uint32 nActiveEngineID~%string strActiveEngineDescription~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'navigator_engine_status)))
  "Returns full string definition for message of type 'navigator_engine_status"
  (cl:format cl:nil "Header header~%uint32 nActiveEngineID~%string strActiveEngineDescription~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <navigator_engine_status>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4 (cl:length (cl:slot-value msg 'strActiveEngineDescription))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <navigator_engine_status>))
  "Converts a ROS message object to a list"
  (cl:list 'navigator_engine_status
    (cl:cons ':header (header msg))
    (cl:cons ':nActiveEngineID (nActiveEngineID msg))
    (cl:cons ':strActiveEngineDescription (strActiveEngineDescription msg))
))
