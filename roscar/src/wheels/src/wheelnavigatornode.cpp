using namespace std; 
#include "wheelnavigator.h"

int main(int argc, char **argv)
{
	ros::init(argc, argv, "wheel navigator");

	yisys_roswheels::CWheelNavigator navigator;
	
	navigator.Init();
	
	ros::Rate loop_rate(10);
	while (ros::ok())
	{
		ros::spinOnce();
		loop_rate.sleep();
	}
	return 1;
}
