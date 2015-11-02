#ifndef __WHEELS_STATUS_CALLBACK_HANDLER__
#define __WHEELS_STATUS_CALLBACK_HANDLER__
#include <actionlib/server/simple_action_server.h>
#include "wheels/wheels_status.h"
#include "wheels/cmd_get_one_wheel_status.h"
#include "wheels/cmd_set_car_direction_speed.h"
#include "wheels/set_car_direction_speedAction.h"
class CTwoWheelsController;
class CWheelStatusCallbackHandler
{
public:
	CWheelStatusCallbackHandler(std::string name);
	virtual ~CWheelStatusCallbackHandler();
	
	bool cbSetDirectionAndSpeed(wheels::cmd_set_car_direction_speedRequest &req,
							wheels::cmd_set_car_direction_speedResponse &res);
	
	bool cbGetOneWheelStatus(wheels::cmd_get_one_wheel_statusRequest &req,
								wheels::cmd_get_one_wheel_statusResponse &res);
								
	void goalCB();
	void preemptCB();
	void executeCB(const wheels::set_car_direction_speedGoalConstPtr &goal);
	void PublishWheelsStatus(void);
	
protected:
	int32_t cbSetDirectionAndSpeed(uint32_t, uint32_t);
protected:
	CTwoWheelsController *m_pGlobalCarController;
	ros::Publisher m_WheelStatusPublisher;
	ros::ServiceServer m_SetDirectionSpeedService;
	ros::ServiceServer m_GetOneWheelStatusService;
	ros::NodeHandle m_nNodeHandle;
	actionlib::SimpleActionServer<wheels::set_car_direction_speedAction> m_ActionServer;
	std::string m_strAction_Name;
	int m_nData_count, m_nGoal;
	float sum_, sum_sq_;
	wheels::set_car_direction_speedFeedback m_Feedback;
	wheels::set_car_direction_speedActionResult m_Result;
	ros::Subscriber m_SubScriber;	
};
#endif
