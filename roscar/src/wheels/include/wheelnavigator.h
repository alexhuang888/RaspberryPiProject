#ifndef __CWHEELNAVIGATOR_H__
#define __CWHEELNAVIGATOR_H__
#pragma once
#include "ros/ros.h"
#include "cnavigatorenginebase.h"
#include "wheels/cmd_get_navigator_engine_status.h"
#include "wheels/cmd_set_navigator_engine.h"


// here, we would like to design a navigator fasade, which can include several
// navigator, then advertise "wheel_cmd_vel" to wheel driver.
// among all these navigator, they are:
// 1. Arcu tracker
// 2. Line detector
// 3. Road detector

#include "map"

namespace yisys_roswheels
{
typedef std::pair<uint32_t, CNavigatorEngineBase *> EnginePoolPairType;
typedef std::map<uint32_t, CNavigatorEngineBase *> EnginePoolType;
typedef std::map<uint32_t, CNavigatorEngineBase *>::iterator EnginePoolIteratorType;


class CWheelNavigator : public CNavigatorCallback
{
public:
	CWheelNavigator();
	virtual ~CWheelNavigator();

	int32_t SetTrackingEngine(uint32_t nEngineID);
	uint32_t GetTrackingEngineID(void);
	
	int32_t Init(void);
	int32_t StopAll(void) { return SetTrackingEngine(0); };
	
	bool cbSetEngine(wheels::cmd_set_navigator_engineRequest &req,
							wheels::cmd_set_navigator_engineResponse &res);
	
	bool cbGetEngineStatus(wheels::cmd_get_navigator_engine_statusRequest &req,
								wheels::cmd_get_navigator_engine_statusResponse &res);
								
	void PublishEngineStatus(void);
	
public:
	virtual int32_t ProcessCmdVels(const geometry_msgs::Twist &velMsg);
protected:
	EnginePoolType m_EnginePool;
	uint32_t m_ActiveEngineID;
	CNavigatorEngineBase *m_pTrackingEngine;
	
	ros::NodeHandle m_nNodeHandle;
	ros::Publisher m_EngineStatusPublisher;
	ros::ServiceServer m_SetNavigatorEngineService;
	ros::ServiceServer m_GetNavigatorEngineService;
	ros::Publisher m_WheelCmdVelPublisher;
};
};
#endif
