
(cl:in-package :asdf)

(defsystem "wheels-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "cmd_set_car_two_wheels_direction_speed" :depends-on ("_package_cmd_set_car_two_wheels_direction_speed"))
    (:file "_package_cmd_set_car_two_wheels_direction_speed" :depends-on ("_package"))
    (:file "cmd_get_navigator_engine_status" :depends-on ("_package_cmd_get_navigator_engine_status"))
    (:file "_package_cmd_get_navigator_engine_status" :depends-on ("_package"))
    (:file "cmd_send_manual_instruction" :depends-on ("_package_cmd_send_manual_instruction"))
    (:file "_package_cmd_send_manual_instruction" :depends-on ("_package"))
    (:file "cmd_get_one_wheel_status" :depends-on ("_package_cmd_get_one_wheel_status"))
    (:file "_package_cmd_get_one_wheel_status" :depends-on ("_package"))
    (:file "cmd_set_car_direction_speed" :depends-on ("_package_cmd_set_car_direction_speed"))
    (:file "_package_cmd_set_car_direction_speed" :depends-on ("_package"))
    (:file "cmd_set_navigator_engine" :depends-on ("_package_cmd_set_navigator_engine"))
    (:file "_package_cmd_set_navigator_engine" :depends-on ("_package"))
  ))