#include "ros/ros.h"
#include "std_msgs/String.h"
#include <tf2_ros/transform_listener.h>
#include <geometry_msgs/Twist.h>
using namespace std; 
int main(int argc, char **argv)
{
	float fXOffset = 0, fYOffset = 0;
	int32_t nCenterX = 0, nCenterY = 0;
	uint32_t nTick = 0;

	ros::init(argc, argv, "moving_vel_aruco_tracker");

	ros::NodeHandle node;

	ros::Publisher wheels_vel = node.advertise<geometry_msgs::Twist>("wheels/cmd_vel", 10);
	
	tf2_ros::Buffer tfBuffer;
	tf2_ros::TransformListener tfListener(tfBuffer);

	ros::Rate rate(10.0);
	while (node.ok())
	{
		geometry_msgs::TransformStamped transformStamped;
		try{
			transformStamped = tfBuffer.lookupTransform("camera1", "board1",
			ros::Time(0));
		}
		catch (tf2::TransformException &ex) {
			ROS_WARN("%s",ex.what());
			ros::Duration(1.0).sleep();
			continue;
		}

		geometry_msgs::Twist vel_msg;

		vel_msg.angular.z = 4.0 * atan2(transformStamped.transform.translation.y,
							transformStamped.transform.translation.x);
		vel_msg.linear.x = 0.5 * sqrt(pow(transformStamped.transform.translation.x, 2) +
							pow(transformStamped.transform.translation.y, 2));
		wheels_vel.publish(vel_msg);

		ROS_INFO("vel_msg:angular:%f, linear:%f", vel_msg.angular.z, vel_msg.linear.x);
		rate.sleep();
	}

	return 1;
}
