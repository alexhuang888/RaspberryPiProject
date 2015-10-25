#include "ros/ros.h"
#include "std_msgs/String.h"
#include "wheels/wheels_status.h"
#include "wheels/cmd_get_one_wheel_status.h"
#include "wheels/cmd_set_car_direction_speed.h"
#include <sstream>


void wheels_statusCallback(const wheels::wheels_statusConstPtr& msg)
{
  ROS_INFO("I heard: [RW_Status:%d]", msg->nRightWheelHealthyStatus);
}
/**
 * This tutorial demonstrates simple sending of messages over the ROS system.
 */
int main(int argc, char **argv)
{
  /**
   * The ros::init() function needs to see argc and argv so that it can perform
   * any ROS arguments and name remapping that were provided at the command line.
   * For programmatic remappings you can use a different version of init() which takes
   * remappings directly, but for most command-line programs, passing argc and argv is
   * the easiest way to do it.  The third argument to init() is the name of the node.
   *
   * You must call one of the versions of ros::init() before using any other
   * part of the ROS system.
   */
  ros::init(argc, argv, "wheels_status_listener");

  /**
   * NodeHandle is the main access point to communications with the ROS system.
   * The first NodeHandle constructed will fully initialize this node, and the last
   * NodeHandle destructed will close down the node.
   */
  ros::NodeHandle n;

  /**
   * The advertise() function is how you tell ROS that you want to
   * publish on a given topic name. This invokes a call to the ROS
   * master node, which keeps a registry of who is publishing and who
   * is subscribing. After this advertise() call is made, the master
   * node will notify anyone who is trying to subscribe to this topic name,
   * and they will in turn negotiate a peer-to-peer connection with this
   * node.  advertise() returns a Publisher object which allows you to
   * publish messages on that topic through a call to publish().  Once
   * all copies of the returned Publisher object are destroyed, the topic
   * will be automatically unadvertised.
   *
   * The second parameter to advertise() is the size of the message queue
   * used for publishing messages.  If messages are published more quickly
   * than we can send them, the number here specifies how many messages to
   * buffer up before throwing some away.
   */
   
	// implement a topic "Wheels_status" and message "wheels_status"
	
	ros::Subscriber sub = n.subscribe("wheels_status", 1000, wheels_statusCallback);
  
	ros::ServiceClient client = n.serviceClient<wheels::cmd_get_one_wheel_status>("get_one_wheel_status");
	wheels::cmd_get_one_wheel_status srv;
	srv.request.nWheelID = 1;

	if (client.call(srv))
	{
		ROS_INFO("WheelID[%d]: %d, %d, %d", 1, srv.response.nRetCode, srv.response.nWheelDirection, srv.response.nWheelSpeed);
	}
	else
	{
		ROS_ERROR("Failed to call service get_one_wheel_status");
	}
	
	ros::ServiceClient client2 = n.serviceClient<wheels::cmd_set_car_direction_speed>("set_direction_speed");
	wheels::cmd_set_car_direction_speed srv2;
	srv2.request.nNewSpeed = 12;
	srv2.request.nNewDirection = 34;

	if (client2.call(srv2))
	{
		ROS_INFO("Last status: %d, %d, %d", srv2.response.nRetCode, srv2.response.nLastDirection, srv2.response.nLastSpeed);
	}
	else
	{
		ROS_ERROR("Failed to call service set_direction_speed");
	}	
	//ros::spin();


  return 0;
}
