/*
Test GPIO
*/

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
 
#include "gpio.h"

// Turn Left

 
#define MOTOR_A_PIN1 5
#define MOTOR_A_PIN2 6
#define MOTOR_B_PIN1 2 
#define MOTOR_B_PIN2 3

#define MOTOR_A 0
#define MOTOR_B 1

int fnInitializeMotor(int MotorID)
{
	/*
	 * Enable GPIO pins
	 */
	switch (MotorID)
	{
		case MOTOR_A:
			if (-1 == GPIOExport(MOTOR_A_PIN1) || -1 == GPIOExport(MOTOR_A_PIN2))
				return(-1);
		 
			/*
			 * Set GPIO directions
			 */
			if (-1 == GPIODirection(MOTOR_A_PIN1, RPI_GPIO_OUT) || -1 == GPIODirection(MOTOR_A_PIN2, RPI_GPIO_OUT))
				return(-2);		
				
			return 1;
		break;
		case MOTOR_B:
			if (-1 == GPIOExport(MOTOR_B_PIN1) || -1 == GPIOExport(MOTOR_B_PIN2))
				return(-1);
		 
			/*
			 * Set GPIO directions
			 */
			if (-1 == GPIODirection(MOTOR_B_PIN1, RPI_GPIO_OUT) || -1 == GPIODirection(MOTOR_B_PIN2, RPI_GPIO_OUT))
				return(-2);		
				
			return 1;	
		break;
	}
	
	return 0;

}

int fnDeInitializeMotor(int MotorID)
{
	/*
	 * Enable GPIO pins
	 */
	switch (MotorID)
	{
		case MOTOR_A:
			if (-1 == GPIOUnexport(MOTOR_A_PIN1) || -1 == GPIOUnexport(MOTOR_A_PIN2))
				return(-1);
		 				
			return 1;
		break;
		case MOTOR_B:
			if (-1 == GPIOUnexport(MOTOR_B_PIN1) || -1 == GPIOUnexport(MOTOR_B_PIN2))
				return(-1);
				
			return 1;	
		break;
	}
	
	return 0;

}


int fnStop(int MotorID)
{
	switch (MotorID)
	{
		case MOTOR_A:
			if (-1 == GPIOWrite(MOTOR_A_PIN1, RPI_GPIO_LOW))	
				return -3;
			if (-1 == GPIOWrite(MOTOR_A_PIN2, RPI_GPIO_LOW))	
				return -3;
			return 1;
		break;
		case MOTOR_B:
			if (-1 == GPIOWrite(MOTOR_B_PIN1, RPI_GPIO_LOW))	
				return -3;
			if (-1 == GPIOWrite(MOTOR_B_PIN2, RPI_GPIO_LOW))	
				return -3;
			return 1;	
		break;
	}
	
	return 0;	
}

int fnForward(int MotorID)
{
	switch (MotorID)
	{
		case MOTOR_A:
			if (-1 == GPIOWrite(MOTOR_A_PIN1, RPI_GPIO_HIGH))	
				return -3;
			if (-1 == GPIOWrite(MOTOR_A_PIN2, RPI_GPIO_LOW))	
				return -3;
			return 1;
		break;
		case MOTOR_B:
			if (-1 == GPIOWrite(MOTOR_B_PIN1, RPI_GPIO_HIGH))	
				return -3;
			if (-1 == GPIOWrite(MOTOR_B_PIN2, RPI_GPIO_LOW))	
				return -3;
			return 1;	
		break;
	}
	
	return 0;		
}

int fnBackward(int MotorID)
{
	switch (MotorID)
	{
		case MOTOR_A:
			if (-1 == GPIOWrite(MOTOR_A_PIN1, RPI_GPIO_LOW))	
				return -3;
			if (-1 == GPIOWrite(MOTOR_A_PIN2, RPI_GPIO_HIGH))	
				return -3;
			return 1;
		break;
		case MOTOR_B:
			if (-1 == GPIOWrite(MOTOR_B_PIN1, RPI_GPIO_LOW))	
				return -3;
			if (-1 == GPIOWrite(MOTOR_B_PIN2, RPI_GPIO_HIGH))	
				return -3;
			return 1;	
		break;
	}
	
	return 0;		
}

int fnTurnLeft(int nLeftID, int nRightID)
{
	if (fnStop(nLeftID) <= 0 || fnStop(nRightID) <= 0)
		return -5;
	if (fnForward(nRightID) <= 0)
		return -6;
	return 1;	
}

int fnTurnRight(int nLeftID, int nRightID)
{
	if (fnStop(nLeftID) <= 0 || fnStop(nRightID) <= 0)
		return -5;
	if (fnForward(nLeftID) <= 0)
		return -6;
	return 1;	
}
#define USLEEPTIME 2000000
#define USLEEPTIME_500ms 500000
int
main(int argc, char *argv[])
{
	int repeat = 10;
 
	/*
	 * Enable GPIO pins
	 */
	printf("Initialize Motor\n");
	if (fnInitializeMotor(MOTOR_A) <= 0 || fnInitializeMotor(MOTOR_B) <= 0)
	{
		printf("Fail to initailize motor\n");
		return(-11);
	}
	usleep(USLEEPTIME_500ms);
	printf("Stop Motor\n");
	// stop all
	if (fnStop(MOTOR_A) <= 0 || fnStop(MOTOR_B) <= 0)
	{
		printf("Fail to Stop motor\n");
		return(-12);
	}	
	usleep(USLEEPTIME_500ms);
	printf("Forward Motor\n");
	if (fnForward(MOTOR_A) <= 0 || fnForward(MOTOR_B) <= 0)
	{
		printf("Fail to forward motor\n");
		return(-13);
	}	
	usleep(USLEEPTIME);
	printf("Backward Motor\n");
	if (fnBackward(MOTOR_A) <= 0 || fnBackward(MOTOR_B) <= 0)
	{
		printf("Fail to forward motor\n");
		return(-14);
	}
	usleep(USLEEPTIME);
	printf("Turn left\n");
	if (fnTurnLeft(MOTOR_A, MOTOR_B) <= 0)
	{
		printf("Fail to turn left\n");
		return(-15);
	}	
	usleep(USLEEPTIME);
	printf("Turn Right\n");
	if (fnTurnRight(MOTOR_A, MOTOR_B) <= 0)
	{
		printf("Fail to turn left\n");
		return(-16);
	}	
	usleep(USLEEPTIME);
	// stop all
	printf("Stop Motor\n");
	if (fnStop(MOTOR_A) <= 0 || fnStop(MOTOR_B) <= 0)
	{
		printf("Fail to Stop motor\n");
		return(-12);
	}
	usleep(USLEEPTIME_500ms);	
	/*
	 * Disable GPIO pins
	 */
	printf("DeInitialize Motor\n");
	if (fnDeInitializeMotor(MOTOR_A) <= 0 || fnDeInitializeMotor(MOTOR_B) <= 0)
	{
		printf("Fail to Deinitailize motor\n");
		return(-17);
	}
	printf("Done!\n");
 
	return(1);
}
