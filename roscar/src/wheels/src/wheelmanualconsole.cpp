#include "ros/ros.h"
#include <sstream>
#include <termios.h>
#include "wheeldriver.h"

int mygetch (void)
{
  int ch;
  struct termios oldt, newt;

  tcgetattr ( STDIN_FILENO, &oldt );
  newt = oldt;
  newt.c_lflag &= ~( ICANON | ECHO );
  tcsetattr ( STDIN_FILENO, TCSANOW, &newt );
  ch = getchar();
  tcsetattr ( STDIN_FILENO, TCSANOW, &oldt );

  return ch;
}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "wheel driver");

	yisys_roswheels::CWheelDriver WheelDriver(ros::this_node::getName());
	
	uint32_t nInput = 0;
	printf("Input instruction (0: disable all navigator engine, 1: line-follower, o: manual stop, k: manual restart, u: forward, d: backward, l: left, r: right, w: right-backward, z: left-backward, p: stop, i: wheel status\n");
	while ((nInput = mygetch()) != 27)
	{
		WheelDriver.KeyCodeToWheelController(nInput);
	}
  return 0;
}
