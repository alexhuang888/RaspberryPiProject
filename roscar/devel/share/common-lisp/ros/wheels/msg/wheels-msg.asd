
(cl:in-package :asdf)

(defsystem "wheels-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "wheels_status" :depends-on ("_package_wheels_status"))
    (:file "_package_wheels_status" :depends-on ("_package"))
    (:file "set_car_direction_speedGoal" :depends-on ("_package_set_car_direction_speedGoal"))
    (:file "_package_set_car_direction_speedGoal" :depends-on ("_package"))
    (:file "set_car_direction_speedFeedback" :depends-on ("_package_set_car_direction_speedFeedback"))
    (:file "_package_set_car_direction_speedFeedback" :depends-on ("_package"))
    (:file "set_car_direction_speedActionFeedback" :depends-on ("_package_set_car_direction_speedActionFeedback"))
    (:file "_package_set_car_direction_speedActionFeedback" :depends-on ("_package"))
    (:file "set_car_direction_speedAction" :depends-on ("_package_set_car_direction_speedAction"))
    (:file "_package_set_car_direction_speedAction" :depends-on ("_package"))
    (:file "set_car_direction_speedActionResult" :depends-on ("_package_set_car_direction_speedActionResult"))
    (:file "_package_set_car_direction_speedActionResult" :depends-on ("_package"))
    (:file "set_car_direction_speedResult" :depends-on ("_package_set_car_direction_speedResult"))
    (:file "_package_set_car_direction_speedResult" :depends-on ("_package"))
    (:file "set_car_direction_speedActionGoal" :depends-on ("_package_set_car_direction_speedActionGoal"))
    (:file "_package_set_car_direction_speedActionGoal" :depends-on ("_package"))
  ))