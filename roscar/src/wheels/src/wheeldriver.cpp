#include "ros/ros.h"
#include "std_msgs/String.h"
#include "wheeldriver.h"
#include "wheelcontroller.h"
#include "wheelmotorengine.h"
#include "wheels/cmd_get_navigator_engine_status.h"
#include "wheels/cmd_set_navigator_engine.h"
#include "clinefollowernavigatorengine.h"
#include "clinefollowernavigatorengine2.h"
#include "clanedetectornavigatorengine.h"
#include "globalinc.h"
namespace yisys_roswheels
{
CWheelDriver::CWheelDriver(std::string nodename) :
							m_strNode_Name(nodename)
{
	m_GetWheelStatusClient = m_nNodeHandle.serviceClient<wheels::cmd_get_one_wheel_status>("get_one_wheel_status");

	m_GetNavigatorEngineStatusClient = m_nNodeHandle.serviceClient<wheels::cmd_get_navigator_engine_status>("get_navigator_engine_status");

	m_SetSpeedClient = m_nNodeHandle.serviceClient <wheels::cmd_set_car_direction_speed>("set_direction_speed");

	m_SetTwoWheelsSpeedClient = m_nNodeHandle.serviceClient <wheels::cmd_set_car_two_wheels_direction_speed>("set_two_wheels_direction_speed");

	m_SetNavigatorEngine = m_nNodeHandle.serviceClient <wheels::cmd_set_navigator_engine>("set_navigator_engine");

	m_CmdVelSubscriber = m_nNodeHandle.subscribe<geometry_msgs::Twist>("wheels_cmd_vel", 1000,
										boost::bind(&CWheelDriver::wheels_CmdVelCallback, this, _1));

	m_SendManualInstructionService = m_nNodeHandle.advertiseService("send_manual_instruction", &CWheelDriver::cbSendManualInstruction, this);

	m_bCarStopped = true;
	m_nCurrentUserSpeed = 0;
	m_nCurrentUserDirection = WCLR_STOP;
	m_bManualStop = false;
	m_bDisplayDebugImage = false;

	m_fThisShiftError = 0.f;
	m_fLastShiftError = 0.f;
	m_fAccumulatedShiftError = 0.f;
	m_fKp = WHEELPIDMAXSPEED;
	m_fKi = 0.01f;
	m_fKd = m_fKp / 2;
}

bool CWheelDriver::cbSendManualInstruction(wheels::cmd_send_manual_instructionRequest &req,
							wheels::cmd_send_manual_instructionResponse &res)
{
	res.nRetCode = KeyCodeToWheelController(req.nManualInstruction);

	return true;
}

void CWheelDriver::wheels_CmdVelCallback(const geometry_msgs::Twist::ConstPtr& msg)
{
	m_LastMsgTime = time(NULL);
	//printf("CWheelDriver: z=%f, x=%f\n", msg->angular.z, msg->linear.x);
	CmdVelToWheelController(msg->angular.z, msg->linear.x);
}

int32_t CWheelDriver::_SetSpeedDirection(int32_t nSpeed, int32_t nDirection)
{
	int32_t nRet = 0;

	wheels::cmd_set_car_direction_speed srv2;

	if (m_bManualStop)
	{
		nRet = 1;
		goto err_out;
	}

	if (nSpeed > FULLSPEED)
		nSpeed = FULLSPEED;

	if (nSpeed < 0)
		nSpeed = 0;

	srv2.request.nNewSpeed = nSpeed;
	srv2.request.nNewDirection = nDirection;
	//printf("New Speed=%d, New Dir = %d\n", nSpeed, nDirection);
	if (m_SetSpeedClient.call(srv2))
	{
		m_nCurrentUserSpeed = nSpeed;
		m_nCurrentUserDirection = nDirection;

		//ROS_INFO("Set New Car direction=%d speed=%d", srv2.request.nNewDirection, srv2.request.nNewSpeed);
		//ROS_INFO("Last car status: RetCode=%d: last_dir=%d, last_speed=%d", srv2.response.nRetCode, srv2.response.nLastDirection, srv2.response.nLastSpeed);
		//nRet = 1;
		//ROS_INFO("Cannot receive cmd_vel, stop the car");
		if (nSpeed == 0 || m_nCurrentUserDirection == WCLR_STOP)
		{
			m_bCarStopped = true;
		}
		nRet = 1;
	}
	else
	{
		ROS_ERROR("Failed to call service set_direction_speed");
	}
err_out:
	return nRet;
}
void CWheelDriver::Checklongpause(void)
{
	time_t now = time(NULL);

	if (difftime(now, m_LastMsgTime) > 1 && m_bCarStopped == false)
	{
		//_SetSpeedDirection(0, WCLR_STOP);
		ROS_INFO("Does not receive nagivator cmd_vels for over 5 seconds. Stop the car.");
	}
}

// fAngular: angular direction and speed
//				fAngular value: positive: right turn, negative: left turn. value is from 0-90 or 0 to -90
//											when fabs(fAngular) is over tolerance, then it is decide to turn
// fLinear: linear direction and speed (Positive: forward, negative: backward)
//			fLinear value: normalized (0..1), mapping from 0 to 100 for wheel speed
/*
int32_t CWheelDriver::CmdVelToWheelController(float fAngular, float fLinear)
{
	int32_t nRet = 0;
	int32_t nNewSpeed = 0;
	int32_t nNewDirection = WCLR_STOP;

	wheels::cmd_set_car_direction_speed srv2;

	float fXOffset = fabs(fAngular);


	if (fLinear == 0)
	{
		nNewDirection = WCLR_STOP;
	}
	else
	{
		if (fabs(fAngular) > WHEELANGULAR_TOLERANCE)
		{
			// could be run and turn
			if (fAngular > 0)
			{
				if (fLinear > 0)
					nNewDirection = WCLR_FORWARDRIGHTTURN;	// turn right
				else
					nNewDirection = WCLR_BACKWARDRIGHTTURN;	// turn right
			}
			else
			{
				if (fLinear > 0)
					nNewDirection = WCLR_FORWARDLEFTTURN;	// turn left
				else
					nNewDirection = WCLR_BACKWARDLEFTTURN;	// turn left
			}
		}
		else
		{
			// check if forward or backward
			if (fLinear > 0)
				nNewDirection = WCLR_FORWARD;	// forward
			else
				nNewDirection = WCLR_BACKWARD;	// backward

		}
	}

	nNewSpeed = (fabs(fLinear) * 100.);	// max speed;
	//printf("fAngular=%f, fLinear=%f, nNewDirection=%d\n", fAngular, fLinear, nNewDirection);
	//else
	{
		nRet = _SetSpeedDirection(m_nCurrentUserSpeed, nNewDirection);
	}


	return nRet;
}
*/
int32_t CWheelDriver::CmdVelToWheelController(float fAngular, float fLinear)
{
	int32_t nRet = 0;

	wheels::cmd_set_car_two_wheels_direction_speed srv2;

// fAngular: negative (target shift to left, turn left), or Positive (should turn right)
	m_fThisShiftError = (fAngular);

	m_fAccumulatedShiftError += m_fThisShiftError;

	float fErrorDiff = (m_fThisShiftError - m_fLastShiftError);

	//m_fKp = m_nCurrentUserSpeed;
	float nNewSpeed = m_fKp * m_fThisShiftError + m_fKi * m_fAccumulatedShiftError + m_fKd * fErrorDiff;

	m_fLastShiftError = m_fThisShiftError;

	int nNewRightSpeed, nNewLeftSpeed, nNewRightDirection, nNewLeftDirection;

	if (nNewSpeed < 0) // left turn
	{
		nNewRightSpeed = -nNewSpeed;
		nNewRightDirection = CMC_MOTORFORWARD;

		//nNewLeftSpeed = WHEELPIDMAXSPEED - nNewRightSpeed;
		nNewLeftSpeed = nNewSpeed;
		nNewLeftDirection = CMC_MOTORFORWARD;
	}
	else
	{
		nNewLeftSpeed = nNewSpeed;
		nNewLeftDirection = CMC_MOTORFORWARD;

		//nNewRightSpeed = WHEELPIDMAXSPEED - nNewLeftSpeed;
		nNewRightSpeed = -nNewSpeed;
		nNewRightDirection = CMC_MOTORFORWARD;
	}
	if (m_nCurrentUserSpeed == 0)	// users prefer to stop
	{
		nNewRightSpeed = 0;
		nNewLeftSpeed = 0;
	}
	else
	{
		nNewRightSpeed += m_nCurrentUserSpeed;
		nNewLeftSpeed += m_nCurrentUserSpeed;
	}
	if (nNewRightSpeed > FULLSPEED)
		nNewRightSpeed = FULLSPEED;
	if (nNewRightSpeed < 0)
		nNewRightSpeed = 0;

	if (nNewLeftSpeed > FULLSPEED)
		nNewLeftSpeed = FULLSPEED;
	if (nNewLeftSpeed < 0)
		nNewLeftSpeed = 0;
	if (m_bManualStop)
	{
		nRet = 1;
		goto err_out;
	}

	srv2.request.nNewLeftSpeed = nNewLeftSpeed;
	srv2.request.nNewLeftDirection = nNewLeftDirection;

	srv2.request.nNewRightSpeed = nNewRightSpeed;
	srv2.request.nNewRightDirection = nNewRightDirection;

	printf("New two wheels (%f, %f, %f)(Speed, Dir) Left(%d, %d), right(%d, %d)\n", fAngular, nNewSpeed, fErrorDiff, nNewLeftSpeed, nNewLeftDirection, nNewRightSpeed, nNewRightDirection);
	if (m_SetTwoWheelsSpeedClient.call(srv2))
	{
		//m_nCurrentUserSpeed = nSpeed;
		//m_nCurrentUserDirection = nDirection;

		//ROS_INFO("Set New Car direction=%d speed=%d", srv2.request.nNewDirection, srv2.request.nNewSpeed);
		//ROS_INFO("Last car status: RetCode=%d: last_dir=%d, last_speed=%d", srv2.response.nRetCode, srv2.response.nLastDirection, srv2.response.nLastSpeed);
		//nRet = 1;
		//ROS_INFO("Cannot receive cmd_vel, stop the car");
		if (srv2.response.nNewLeftSpeed == 0 && srv2.response.nNewRightSpeed == 0)
		{
			m_bCarStopped = true;
		}
		nRet = 1;
	}
	else
	{
		ROS_ERROR("Failed to call service set_two_wheels_direction_speed");
	}
err_out:


	return nRet;
}
int32_t CWheelDriver::KeyCodeToWheelController(unsigned char nInput)
{
	int32_t nRet = 0;

	int32_t nNewSpeed = m_nCurrentUserSpeed;
	int32_t nNewDirection = m_nCurrentUserDirection;
	//printf("input=%d\n", nInput);
	switch (nInput)
	{
		case 'y':	// display debug image
		{
			m_bDisplayDebugImage = !m_bDisplayDebugImage;
			m_nNodeHandle.setParam(WGP_DEBUG_SHOWIMAGE, m_bDisplayDebugImage);
		}
			break;
		case 'k':
			if (m_bManualStop)
			{
				m_bManualStop = false;
				ROS_INFO("UnBlock all incoming cmd_vels.");
			}
			break;
		case 'o':
			if (!m_bManualStop)
			{
				nNewSpeed = 0;
				nNewDirection = WCLR_STOP;
				nRet = _SetSpeedDirection(nNewSpeed, nNewDirection);
				m_bManualStop = true;
				ROS_INFO("Force to stop. Block all incoming cmd_vels.");
			}
			break;
		case 'p':
			if (!m_bManualStop)
			{
				nNewSpeed = 0;
				nNewDirection = WCLR_STOP;
				nRet = _SetSpeedDirection(nNewSpeed, nNewDirection);
				//ROS_INFO("Park the car.");
			}
			break;
		case '+':
			if (!m_bManualStop)
			{
				//printf("Before +, speed=%d, dir=%d\n", nNewSpeed, nNewDirection);
				nNewSpeed += 5;
				nRet = _SetSpeedDirection(nNewSpeed, nNewDirection);
				//ROS_INFO("Accelerate.");
			}
			break;
		case '-':
			if (!m_bManualStop)
			{
				nNewSpeed -= 5;
				nRet = _SetSpeedDirection(nNewSpeed, nNewDirection);
			}
			break;
		case 'u':
			if (!m_bManualStop)
			{
				nNewDirection = WCLR_FORWARD;
				nRet = _SetSpeedDirection(nNewSpeed, nNewDirection);
			}
			break;
		case 'd':
			if (!m_bManualStop)
			{
				nNewDirection = WCLR_BACKWARD;
				nRet = _SetSpeedDirection(nNewSpeed, nNewDirection);
			}
			break;
		case 'l':
			if (!m_bManualStop)
			{
				nNewDirection = WCLR_FORWARDRIGHTTURN;
				nRet = _SetSpeedDirection(nNewSpeed, nNewDirection);
			}
			break;
		case 'r':
			if (!m_bManualStop)
			{
				nNewDirection = WCLR_FORWARDLEFTTURN;
				nRet = _SetSpeedDirection(nNewSpeed, nNewDirection);
			}
			break;
		case 'w':
			if (!m_bManualStop)
			{
				nNewDirection = WCLR_BACKWARDRIGHTTURN;
				nRet = _SetSpeedDirection(nNewSpeed, nNewDirection);
			}
			break;
		case 'z':
			if (!m_bManualStop)
			{
				nNewDirection = WCLR_BACKWARDLEFTTURN;
				nRet = _SetSpeedDirection(nNewSpeed, nNewDirection);
			}
			break;
		case 'i':
		{
			wheels::cmd_get_one_wheel_status srv;
			wheels::cmd_get_navigator_engine_status engsrv;

			GetWheelStatus(CMC_LEFTWHEELID, srv);
			ROS_INFO("WheelID[%d] Ret=%d: dir=%d, speed=%d, health=%d", CMC_LEFTWHEELID, srv.response.nRetCode, srv.response.nWheelDirection, srv.response.nWheelSpeed, srv.response.nWheelHealthStatus);

			GetWheelStatus(CMC_RIGHTWHEELID, srv);
			ROS_INFO("WheelID[%d] Ret=%d: dir=%d, speed=%d, health=%d", CMC_RIGHTWHEELID, srv.response.nRetCode, srv.response.nWheelDirection, srv.response.nWheelSpeed, srv.response.nWheelHealthStatus);
			if (m_GetNavigatorEngineStatusClient.call(engsrv))
			{
				ROS_INFO("Active Navigator Engine, ID=%d [%s]", engsrv.response.nActiveEngineID, engsrv.response.strActiveEngineDescription.c_str());
			}
			else
			{
				ROS_INFO("Fail to query navigator engine status");
			}
			ROS_INFO("Current User Direction=%d, Current User Speed=%d", m_nCurrentUserDirection, m_nCurrentUserSpeed);
			if (m_bManualStop)
			{
				ROS_INFO("Manual stop is on");
			}
			else
			{
				ROS_INFO("Manual stop is off");
			}
			if (m_bDisplayDebugImage)
			{
				ROS_INFO("Debug image is on");
			}
			else
			{
				ROS_INFO("Debug image is off");
			}
			break;
		}
		case '0':	// disable all navigator engine
		{
			wheels::cmd_set_navigator_engine engset;
			if (!m_bManualStop)
			{
				nNewSpeed = 0;
				nNewDirection = WCLR_STOP;
				_SetSpeedDirection(nNewSpeed, nNewDirection);
			}
			//m_bManualStop = true;
			engset.request.nNewEngineID = 0;
			if (m_SetNavigatorEngine.call(engset))
			{
				/*
				ROS_INFO("Active Navigator Engine, ID=%d [%s], Old Navigator Engine ID=%d [%s]", engset.response.nActiveEngineID,
																								engset.response.strActiveEngineDescription.c_str(),
																								engset.response.nLastEngineID,
																								engset.response.strLastEngineDescription.c_str());
			*/
			}
			else
			{
				ROS_INFO("Fail to set navigator engine");
			}
			if (m_bDisplayDebugImage)
				ROS_INFO("Display Debug image.");
			else
				ROS_INFO("Hide Debug Image.");
		}
			break;
		case '1':	// line follower
		{
			wheels::cmd_set_navigator_engine engset;

			engset.request.nNewEngineID = WEID_LINEFOLLOWERENGINE;
			if (m_SetNavigatorEngine.call(engset))
			{
				if (engset.response.nRetCode <= 0)
				{
					ROS_INFO("fail to set Line follower engine");
				}
				else
				{
					/*
				ROS_INFO("Active Navigator Engine, ID=%d [%s], Old Navigator Engine ID=%d [%s]", engset.response.nActiveEngineID,
																								engset.response.strActiveEngineDescription.c_str(),
																								engset.response.nLastEngineID,
																								engset.response.strLastEngineDescription.c_str());
				*/
				}
			}
			else
			{
				ROS_INFO("Fail to set navigator engine");
			}
		}
			break;
		case '2':	// lane detector
		{
			wheels::cmd_set_navigator_engine engset;

			engset.request.nNewEngineID = WEID_LANEDETECTORENGINE;
			if (m_SetNavigatorEngine.call(engset))
			{
				if (engset.response.nRetCode <= 0)
				{
					ROS_INFO("fail to set lane detector engine");
				}
				else
				{
					/*
					ROS_INFO("Active Navigator Engine, ID=%d [%s], Old Navigator Engine ID=%d [%s]", engset.response.nActiveEngineID,
																								engset.response.strActiveEngineDescription.c_str(),
																								engset.response.nLastEngineID,
																								engset.response.strLastEngineDescription.c_str());
				*/
				}
			}
			else
			{
				ROS_INFO("Fail to set navigator engine");
			}

		}
			break;
		case '3':	// line follower2
		{
			wheels::cmd_set_navigator_engine engset;

			engset.request.nNewEngineID = WEID_LINEFOLLOWERENGINE2;
			if (m_SetNavigatorEngine.call(engset))
			{
				if (engset.response.nRetCode <= 0)
				{
					ROS_INFO("fail to set Line follower engine2");
				}
				else
				{
					/*
				ROS_INFO("Active Navigator Engine, ID=%d [%s], Old Navigator Engine ID=%d [%s]", engset.response.nActiveEngineID,
																								engset.response.strActiveEngineDescription.c_str(),
																								engset.response.nLastEngineID,
																								engset.response.strLastEngineDescription.c_str());
				*/
				}
			}
			else
			{
				ROS_INFO("Fail to set navigator engine2");
			}
		}
			break;
		case 'h':
			printf("Input instruction (0: disable all navigator engine, 1: line-follower, 2: lane-detector, o: manual stop, k: manual restart, u: forward, d: backward, l: left, r: right, w: right-backward, z: left-backward, p: stop, i: wheel status\n");
			break;
	}

	return nRet;
}

int32_t CWheelDriver::GetWheelStatus(uint32_t nWheelID, wheels::cmd_get_one_wheel_status &Status)
{
	int32_t nRet = 0;

	Status.request.nWheelID = nWheelID;

	if (m_GetWheelStatusClient.call(Status))
	{
		//ROS_INFO("WheelID[%d] Ret=%d: dir=%d, speed=%d, health=%d", CMC_LEFTWHEELID, srv.response.nRetCode, srv.response.nWheelDirection, srv.response.nWheelSpeed, srv.response.nWheelHealthStatus);
		nRet = 1;
	}
	else
	{
		ROS_ERROR("Failed to call service get_one_wheel_status");
	}
	return nRet;
}
}

