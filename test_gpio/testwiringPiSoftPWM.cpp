/* test wiringPi */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include "wiringPi.h"
#include "softPwm.h"
// Turn Left

 
#define MOTOR_A_PIN1 5
#define MOTOR_A_PIN2 6
#define MOTOR_B_PIN1 2 
#define MOTOR_B_PIN2 3

#define MOTOR_A 0
#define MOTOR_B 1
#define RPI_GPIO_LOW LOW
#define RPI_GPIO_HIGH HIGH

#define FULLSPEED (255)
#define HALFSPEED (128)
#define LOWSPEED (128)
int fnInitializeMotor(int MotorID)
{
	/*
	 * Enable GPIO pins
	 */
	switch (MotorID)
	{
		case MOTOR_A:
			pinMode(MOTOR_A_PIN1, OUTPUT);
			pinMode(MOTOR_A_PIN2, OUTPUT);
			pullUpDnControl(MOTOR_A_PIN1, PUD_OFF);
			pullUpDnControl(MOTOR_A_PIN2, PUD_OFF);
			softPwmCreate(MOTOR_A_PIN1, 0, FULLSPEED);
			softPwmCreate(MOTOR_A_PIN2, 0, FULLSPEED);
			return 1;
		break;
		case MOTOR_B:
			pinMode(MOTOR_B_PIN1, OUTPUT);
			pinMode(MOTOR_B_PIN2, OUTPUT);	
			pullUpDnControl(MOTOR_B_PIN1, PUD_OFF);
			pullUpDnControl(MOTOR_B_PIN2, PUD_OFF);	
			softPwmCreate(MOTOR_B_PIN1, 0, FULLSPEED);
			softPwmCreate(MOTOR_B_PIN2, 0, FULLSPEED);						
			return 1;	
		break;
	}
	
	return 0;

}

int fnDeInitializeMotor(int MotorID)
{

	
	return 1;

}


int fnStop(int MotorID)
{
	switch (MotorID)
	{
		case MOTOR_A:
			softPwmWrite(MOTOR_A_PIN1, RPI_GPIO_LOW);
			softPwmWrite(MOTOR_A_PIN2, RPI_GPIO_LOW);
			return 1;
		break;
		case MOTOR_B:
			softPwmWrite(MOTOR_B_PIN1, RPI_GPIO_LOW);
			softPwmWrite(MOTOR_B_PIN2, RPI_GPIO_LOW);
			return 1;	
		break;
	}
	
	return 0;	
}

int fnForward(int MotorID, int nSpeed)
{
	switch (MotorID)
	{
		case MOTOR_A:
			softPwmWrite(MOTOR_A_PIN1, nSpeed);	
			softPwmWrite(MOTOR_A_PIN2, RPI_GPIO_LOW);	

			return 1;
		break;
		case MOTOR_B:
			softPwmWrite(MOTOR_B_PIN1, nSpeed);	
			softPwmWrite(MOTOR_B_PIN2, RPI_GPIO_LOW);	

			return 1;	
		break;
	}
	
	return 0;		
}

int fnBackward(int MotorID, int nSpeed)
{
	switch (MotorID)
	{
		case MOTOR_A:
			softPwmWrite(MOTOR_A_PIN1, RPI_GPIO_LOW);
			softPwmWrite(MOTOR_A_PIN2, nSpeed);
			return 1;
		break;
		case MOTOR_B:
			softPwmWrite(MOTOR_B_PIN1, RPI_GPIO_LOW);
			softPwmWrite(MOTOR_B_PIN2, nSpeed);
			return 1;	
		break;
	}
	
	return 0;		
}

int fnTurnLeft(int nLeftID, int nRightID, int nSpeed)
{
	if (fnStop(nLeftID) <= 0 || fnStop(nRightID) <= 0)
		return -5;
	if (fnForward(nRightID, nSpeed) <= 0)
		return -6;
	return 1;	
}

int fnTurnRight(int nLeftID, int nRightID, int nSpeed)
{
	if (fnStop(nLeftID) <= 0 || fnStop(nRightID) <= 0)
		return -5;
	if (fnForward(nLeftID, nSpeed) <= 0)
		return -6;
	return 1;	
}

int fn2WDTurn(int nLeftID, int nRightID, int nLeftSpeed, int nRightSpeed)
{
	if (fnStop(nLeftID) <= 0 || fnStop(nRightID) <= 0)
		return -5;

	if (nLeftSpeed > 0)
		fnForward(nLeftID, nLeftSpeed);
	else
		fnBackward(nLeftID, -nLeftSpeed);		
	if (nRightSpeed > 0)
		fnForward(nRightID, nRightSpeed);
	else
		fnBackward(nRightID, -nRightSpeed);		
	return 1;	
}


#define USLEEPTIME 2000000
#define USLEEPTIME_500ms 500000

int main(int argc, char *argv[])
{
	printf ("Raspberry Pi wiringPi test\n") ;

	if (wiringPiSetupGpio () == -1)
		return 1 ;
 
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
	if (fnForward(MOTOR_A, LOWSPEED) <= 0 || fnForward(MOTOR_B, LOWSPEED) <= 0)
	{
		printf("Fail to forward motor\n");
		return(-13);
	}	
	usleep(USLEEPTIME);
	printf("Backward Motor\n");
	if (fnBackward(MOTOR_A, LOWSPEED) <= 0 || fnBackward(MOTOR_B, LOWSPEED) <= 0)
	{
		printf("Fail to forward motor\n");
		return(-14);
	}
	usleep(USLEEPTIME);
	printf("Turn left\n");
	if (fnTurnLeft(MOTOR_A, MOTOR_B, FULLSPEED) <= 0)
	{
		printf("Fail to turn left\n");
		return(-15);
	}	
	usleep(USLEEPTIME);
	printf("Turn Right\n");
	if (fnTurnRight(MOTOR_A, MOTOR_B, FULLSPEED) <= 0)
	{
		printf("Fail to turn Right\n");
		return(-16);
	}	
	usleep(USLEEPTIME);
	printf("2WD Turn (100, 100)\n");
	if (fn2WDTurn(MOTOR_A, MOTOR_B, FULLSPEED, FULLSPEED) <= 0)
	{
		printf("Fail to turn left\n");
		return(-16);
	}	
	usleep(USLEEPTIME);		
	printf("2WD Turn (100, 0)\n");
	if (fn2WDTurn(MOTOR_A, MOTOR_B, FULLSPEED, 0) <= 0)
	{
		printf("Fail to turn left\n");
		return(-16);
	}	
	usleep(USLEEPTIME);	
	printf("2WD Turn (0, 100)\n");
	if (fn2WDTurn(MOTOR_A, MOTOR_B, 0, FULLSPEED) <= 0)
	{
		printf("Fail to turn left\n");
		return(-16);
	}	
	usleep(USLEEPTIME);		
	
	printf("2WD Turn (0, -100)\n");
	if (fn2WDTurn(MOTOR_A, MOTOR_B, 0, -FULLSPEED) <= 0)
	{
		printf("Fail to turn left\n");
		return(-16);
	}	
	usleep(USLEEPTIME);	
	printf("2WD Turn (-100, 0)\n");
	if (fn2WDTurn(MOTOR_A, MOTOR_B, -FULLSPEED, 0) <= 0)
	{
		printf("Fail to turn left\n");
		return(-16);
	}	
	usleep(USLEEPTIME);	
	printf("2WD Turn (-50, -50)\n");
	if (fn2WDTurn(MOTOR_A, MOTOR_B, -HALFSPEED, -HALFSPEED) <= 0)
	{
		printf("Fail to turn left\n");
		return(-16);
	}	
	usleep(USLEEPTIME);	
	printf("2WD Turn (-50, 100)\n");
	if (fn2WDTurn(MOTOR_A, MOTOR_B, -HALFSPEED, FULLSPEED) <= 0)
	{
		printf("Fail to turn left\n");
		return(-16);
	}	
	usleep(USLEEPTIME);	
	printf("2WD Turn (100, -50)\n");
	if (fn2WDTurn(MOTOR_A, MOTOR_B, FULLSPEED, -HALFSPEED) <= 0)
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

