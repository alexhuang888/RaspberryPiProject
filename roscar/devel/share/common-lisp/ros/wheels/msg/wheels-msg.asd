
(cl:in-package :asdf)

(defsystem "wheels-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "wheels_status" :depends-on ("_package_wheels_status"))
    (:file "_package_wheels_status" :depends-on ("_package"))
  ))