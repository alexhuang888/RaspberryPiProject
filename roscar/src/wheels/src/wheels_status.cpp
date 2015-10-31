/*
 * In this file, we do prepare to use service/client and action to do the job
 */
#include "ros/ros.h"
#include "std_msgs/String.h"

#include "wheels/wheelcontroller.h"
#include "wheels/wheelcontrollercallbackhandler.h"

#include <sstream>
#include <termios.h>
int mygetch ( void ) 
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
CWheelStatusCallbackHandler::CWheelStatusCallbackHandler(CTwoWheelsController *pController, std::string name) : 
    m_ActionServer(m_nNodeHandle, name, boost::bind(&CWheelStatusCallbackHandler::executeCB, this, _1), false),
    m_strAction_Name(name)
{
	m_pGlobalCarController = pController;

    //register the goal and feeback callbacks
    m_ActionServer.registerGoalCallback(boost::bind(&CWheelStatusCallbackHandler::goalCB, this));
    m_ActionServer.registerPreemptCallback(boost::bind(&CWheelStatusCallbackHandler::preemptCB, this));

    //subscribe to the data topic of interest
    //m_SubScriber = m_nNodeHandle.subscribe("/random_number", 1, &CWheelStatusCallbackHandler::analysisCB, this);
    //m_ActionServer.start();
    
	m_WheelStatusPublisher = m_nNodeHandle.advertise<wheels::wheels_status>("wheels_status", 1000);

	m_SetDirectionSpeedService = m_nNodeHandle.advertiseService("set_direction_speed", &CWheelStatusCallbackHandler::cbSetDirectionAndSpeed, this);
	
	m_GetOneWheelStatusService = m_nNodeHandle.advertiseService("get_one_wheel_status", &CWheelStatusCallbackHandler::cbGetOneWheelStatus, this);    
}

CWheelStatusCallbackHandler::~CWheelStatusCallbackHandler()
{
	m_pGlobalCarController = NULL;
}

void CWheelStatusCallbackHandler::PublishWheelsStatus(void)
{
	wheels::wheels_status status;


	if (m_pGlobalCarController!= NULL)
	{
		m_pGlobalCarController->GetWheelStatus(CMC_LEFTWHEELID, status.nLeftWheelDirection, status.nLeftWheelSpeed, status.nLeftWheelHealthStatus);
		m_pGlobalCarController->GetWheelStatus(CMC_RIGHTWHEELID, status.nRightWheelDirection, status.nRightWheelSpeed, status.nRightWheelHealthStatus);
		ROS_INFO("Left[%d, %d, %d] Right[%d, %d, %d]", status.nLeftWheelDirection, status.nLeftWheelSpeed, status.nLeftWheelHealthStatus, status.nRightWheelDirection, status.nRightWheelSpeed, status.nRightWheelHealthStatus);
	}	
	/**
	* The publish() function is how you send messages. The parameter
	* is the message object. The type of this object must agree with the type
	* given as a template parameter to the advertise<>() call, as was done
	* in the constructor above.
	*/
	m_WheelStatusPublisher.publish(status);	
}
int32_t CWheelStatusCallbackHandler::cbSetDirectionAndSpeed(uint32_t nNewDirection, uint32_t nNewSpeed)
{
	int32_t nRetCode = -1;
	
	if (m_pGlobalCarController != NULL)
	{
		//m_pGlobalCarController->GetDirectionSpeed(res.nLastDirection, res.nLastSpeed);
		
		switch (nNewDirection)
		{
			default:	// stop
				nRetCode = m_pGlobalCarController->Stop();
			break;
			case 1:	//forward
				nRetCode = m_pGlobalCarController->Forward(nNewSpeed);
			break;
			case 2:	//backward
				nRetCode = m_pGlobalCarController->Backward(nNewSpeed);
			break;	
			case 3:	//forward, right turn
				nRetCode = m_pGlobalCarController->TurnRight(nNewSpeed, CMC_MOTORFORWARD);
			break;		
			case 4:	//backward, right turn
				nRetCode = m_pGlobalCarController->TurnRight(nNewSpeed, CMC_MOTORBACKWARD);
			break;
			case 5:	//forward, left turn
				nRetCode = m_pGlobalCarController->TurnLeft(nNewSpeed, CMC_MOTORFORWARD);
			break;		
			case 6:	//backward, left turn
				nRetCode = m_pGlobalCarController->TurnLeft(nNewSpeed, CMC_MOTORBACKWARD);
			break;			
		}
		ROS_INFO("new request: direction=%d, speed=%d", nNewDirection, nNewSpeed);
		//ROS_INFO("sending back response: Code[%d], lastdirection=%d, lastspeed=%d", res.nRetCode, res.nLastDirection, res.nLastSpeed);
	}
	return nRetCode;		
}
bool CWheelStatusCallbackHandler::cbSetDirectionAndSpeed(wheels::cmd_set_car_direction_speedRequest &req,
														wheels::cmd_set_car_direction_speedResponse &res)
{
	res.nRetCode = -1;
	if (m_pGlobalCarController != NULL)
	{
		m_pGlobalCarController->GetDirectionSpeed(res.nLastDirection, res.nLastSpeed);
		res.nRetCode = cbSetDirectionAndSpeed(req.nNewDirection, req.nNewSpeed);

		ROS_INFO("new request: direction=%d, speed=%d", req.nNewDirection, req.nNewSpeed);
		ROS_INFO("sending back response: Code[%d], lastdirection=%d, lastspeed=%d", res.nRetCode, res.nLastDirection, res.nLastSpeed);
		return true;
	}
	return false;		
}

bool CWheelStatusCallbackHandler::cbGetOneWheelStatus(wheels::cmd_get_one_wheel_statusRequest &req,
														wheels::cmd_get_one_wheel_statusResponse &res)
{
	if (m_pGlobalCarController != NULL)
	{
		res.nRetCode = m_pGlobalCarController->GetWheelStatus(req.nWheelID, res.nWheelDirection, res.nWheelSpeed, res.nWheelHealthStatus);
		
		ROS_INFO("request: wheelID=%d", req.nWheelID);
		ROS_INFO("sending back response: RetCode=%d, WheelDirection=%d, wheel Speed=%d wheel healthStatus=%d", res.nRetCode, res.nWheelDirection, res.nWheelSpeed, res.nWheelHealthStatus);
		return true;
	}
	return false;
}	

void CWheelStatusCallbackHandler::goalCB()
{
	// reset helper variables

	// accept the new goal
	//goal_ = m_ActionServer.acceptNewGoal()->samples;
}

void CWheelStatusCallbackHandler::preemptCB()
{
	ROS_INFO("%s: Preempted", m_strAction_Name.c_str());
	// set the action state to preempted
	//as_.setPreempted();
}

 void CWheelStatusCallbackHandler::executeCB(const wheels::set_car_direction_speedGoalConstPtr &goal)
  {

  }
/**
 * This tutorial demonstrates simple sending of messages over the ROS system.
 */
int main(int argc, char **argv)
{
	
	CTwoWheelsController *pGlobalCarController = new CTwoWheelsController(5, 6, 2, 3);
	if (pGlobalCarController == NULL)
	{
		printf("Fail to initialize car controller\n");
		return 0;
	}

	ros::init(argc, argv, "wheels_status");

	CWheelStatusCallbackHandler cbHandler(pGlobalCarController, ros::this_node::getName());
  
	ros::Rate loop_rate(1);

  /**
   * A count of how many messages we have sent. This is used to create
   * a unique string for each message.
   */
	int count = 0;
	
	while (ros::ok())
	{
		/**
		* This is a message object. You stuff it with data, and then publish it.
		*/
		cbHandler.PublishWheelsStatus();

		ros::spinOnce();

		loop_rate.sleep();
		++count;
	}
	if (pGlobalCarController != NULL)
	{
		delete pGlobalCarController;
		pGlobalCarController = NULL;
	}

	return 0;
}
