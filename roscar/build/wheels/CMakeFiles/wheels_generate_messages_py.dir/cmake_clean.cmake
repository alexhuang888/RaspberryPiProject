FILE(REMOVE_RECURSE
  "CMakeFiles/wheels_generate_messages_py"
  "/home/alex/RaspberryPiProject/roscar/devel/lib/python2.7/dist-packages/wheels/msg/_wheels_status.py"
  "/home/alex/RaspberryPiProject/roscar/devel/lib/python2.7/dist-packages/wheels/srv/_cmd_set_car_direction_speed.py"
  "/home/alex/RaspberryPiProject/roscar/devel/lib/python2.7/dist-packages/wheels/srv/_cmd_get_one_wheel_status.py"
  "/home/alex/RaspberryPiProject/roscar/devel/lib/python2.7/dist-packages/wheels/msg/__init__.py"
  "/home/alex/RaspberryPiProject/roscar/devel/lib/python2.7/dist-packages/wheels/srv/__init__.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/wheels_generate_messages_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
