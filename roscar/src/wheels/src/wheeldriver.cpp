#include "ros/ros.h"
#include "std_msgs/String.h"
#include "wheeldriver.h"
#include "wheelcontroller.h"
#include "wheelmotorengine.h"
#include "wheels/cmd_get_navigator_engine_status.h"
#include "wheels/cmd_set_navigator_engine.h"
#include "clinefollowernavigatorengine.h"
namespace yisys_roswheels
{
CWheelDriver::CWheelDriver(std::string nodename) :
							m_strNode_Name(nodename)
{
	m_GetWheelStatusClient = m_nNodeHandle.serviceClient<wheels::cmd_get_one_wheel_status>("get_one_wheel_status");
	
	m_GetNavigatorEngineStatusClient = m_nNodeHandle.serviceClient<wheels::cmd_get_navigator_engine_status>("get_navigator_engine_status");
	
	m_SetSpeedClient = m_nNodeHandle.serviceClient <wheels::cmd_set_car_direction_speed>("set_direction_speed");
	
	m_SetNavigatorEngine = m_nNodeHandle.serviceClient <wheels::cmd_set_navigator_engine>("set_navigator_engine");
	
	m_CmdVelSubscriber = m_nNodeHandle.subscribe<geometry_msgs::Twist>("wheels_cmd_vel", 1000,
										boost::bind(&CWheelDriver::wheels_CmdVelCallback, this, _1));
	m_bCarStopped = true;
	m_nCurrentUserSpeed = 0;
	m_nCurrentUserDirection = WCLR_STOP;
	
	m_bManualStop = false;
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
	m_nCurrentUserSpeed = nSpeed;
	m_nCurrentUserDirection = nDirection;
	
	if (m_nCurrentUserSpeed > FULLSPEED)
		m_nCurrentUserSpeed = FULLSPEED;
	if (m_nCurrentUserSpeed < 0)
		m_nCurrentUserSpeed = 0;		
	srv2.request.nNewSpeed = m_nCurrentUserSpeed;
	srv2.request.nNewDirection = m_nCurrentUserDirection;

	if (m_SetSpeedClient.call(srv2))
	{
		//ROS_INFO("Set New Car direction=%d speed=%d", srv2.request.nNewDirection, srv2.request.nNewSpeed);
		//ROS_INFO("Last car status: RetCode=%d: last_dir=%d, last_speed=%d", srv2.response.nRetCode, srv2.response.nLastDirection, srv2.response.nLastSpeed);
		//nRet = 1;
		//ROS_INFO("Cannot receive cmd_vel, stop the car");
		if (nSpeed == 0 || m_nCurrentUserDirection == WCLR_STOP)
			m_bCarStopped = true;
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

	if (difftime(now, m_LastMsgTime) > 5 && m_bCarStopped == false)
	{
		_SetSpeedDirection(0, WCLR_STOP);
	}
}

// fAngular: angular direction and speed
//				fAngular value: positive: right turn, negative: left turn. value is from 0-90 or 0 to -90
//											when fabs(fAngular) is over tolerance, then it is decide to turn
// fLinear: linear direction and speed (Positive: forward, negative: backward)
//			fLinear value: normalized (0..1), mapping from 0 to 100 for wheel speed

int32_t CWheelDriver::CmdVelToWheelController(float fAngular, float fLinear)
{
	int32_t nRet = 0;
	int32_t nNewSpeed = 0;
	int32_t nNewDirection = WCLR_STOP;
	
	wheels::cmd_set_car_direction_speed srv2;

	float fXOffset = fabs(fAngular);

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

	nNewSpeed = (fabs(fLinear) * 100.);	// max speed;

	if (fLinear == 0)
	{
		nNewDirection = WCLR_STOP;
		nNewSpeed = 0;
	}
	
	nRet = _SetSpeedDirection(nNewSpeed, nNewDirection);
	return nRet;
}

int32_t CWheelDriver::KeyCodeToWheelController(unsigned char nInput)
{
	int32_t nRet = 0;

	int32_t nNewSpeed = m_nCurrentUserSpeed;
	int32_t nNewDirection = m_nCurrentUserDirection;
	
	switch (nInput)
	{
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
			}
			break;
		case '+':
			if (!m_bManualStop)
			{
				nNewSpeed += 5;
				nRet = _SetSpeedDirection(nNewSpeed, nNewDirection);
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
			engset.request.nNewEngineID = 0;
			if (m_SetNavigatorEngine.call(engset))
			{
				ROS_INFO("Active Navigator Engine, ID=%d [%s], Old Navigator Engine ID=%d [%s]", engset.response.nActiveEngineID, 
																								engset.response.strActiveEngineDescription.c_str(), 
																								engset.response.nLastEngineID, 
																								engset.response.strLastEngineDescription.c_str());
			}
			else
			{
				ROS_INFO("Fail to set navigator engine");
			}						
		}	
			break;		
		case '1':	// line follower
		{
			wheels::cmd_set_navigator_engine engset;
			
			engset.request.nNewEngineID = WEID_LINEFOLLOWERENGINE;
			if (m_SetNavigatorEngine.call(engset))
			{
				ROS_INFO("Active Navigator Engine, ID=%d [%s], Old Navigator Engine ID=%d [%s]", engset.response.nActiveEngineID, 
																								engset.response.strActiveEngineDescription.c_str(), 
																								engset.response.nLastEngineID, 
																								engset.response.strLastEngineDescription.c_str());
			}
			else
			{
				ROS_INFO("Fail to set navigator engine");
			}						
		}	
			break;
		case 'h':
			printf("Input instruction (0: disable all navigator engine, 1: line-follower, o: manual stop, k: manual restart, u: forward, d: backward, l: left, r: right, w: right-backward, z: left-backward, p: stop, i: wheel status\n");
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

