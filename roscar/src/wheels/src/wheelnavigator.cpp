#include "wheelnavigator.h"
#include "clinefollowernavigatorengine.h"
#include "wheels/navigator_engine_status.h"
#include "wheels/wheels_status.h"
namespace yisys_roswheels
{
CWheelNavigator::CWheelNavigator()
{
	m_ActiveEngineID = 0;
	m_pTrackingEngine = NULL;
	
	m_EngineStatusPublisher = m_nNodeHandle.advertise<wheels::navigator_engine_status>("navigator_engine_status", 1000);

	m_SetNavigatorEngineService = m_nNodeHandle.advertiseService("set_navigator_engine", &CWheelNavigator::cbSetEngine, this);
	
	m_GetNavigatorEngineService = m_nNodeHandle.advertiseService("get_navigator_engine_status", &CWheelNavigator::cbGetEngineStatus, this);    	

	m_WheelCmdVelPublisher = m_nNodeHandle.advertise<geometry_msgs::Twist>("wheels_cmd_vel", 10);
}

CWheelNavigator::~CWheelNavigator()
{
	EnginePoolIteratorType it;
	
	for (it = m_EnginePool.begin(); it != m_EnginePool.end(); it++)
	{
		if (it->second != NULL)
			delete (it->second);
	}
	m_EnginePool.clear();
}

int32_t CWheelNavigator::Init(void)
{
	// line follower engine
	CLineFollowerNavigatorEngine *pLineFollowerEngine = NULL;
	int32_t nRet = 0;
	
	pLineFollowerEngine = new CLineFollowerNavigatorEngine;
	if (pLineFollowerEngine == NULL)
		goto err_out;
	if (pLineFollowerEngine->SetNavigatorCallback(this) <= 0)
	{
		printf("WheelNavigator: Fail to set navigator pointer to line follower\n");
	}
		
	m_EnginePool.insert(EnginePoolPairType(pLineFollowerEngine->GetEngineID(), pLineFollowerEngine));
	
	nRet = 1;
	
err_out:
	return nRet;	
}

int32_t CWheelNavigator::SetTrackingEngine(uint32_t nEngineID)
{
	int32_t nRet = 0;

	if (m_pTrackingEngine != NULL)
	{
		m_pTrackingEngine->Pause();
	}
	m_ActiveEngineID = 0;
	m_pTrackingEngine = NULL;	
	if (m_EnginePool.find(nEngineID) == m_EnginePool.end())
	{		
		goto err_out; 
	}

	m_ActiveEngineID = nEngineID;
	m_pTrackingEngine = m_EnginePool.at(m_ActiveEngineID);
	if (m_pTrackingEngine != NULL)
	{
		m_pTrackingEngine->Start();
	}
	
	PublishEngineStatus();
err_out:
	return nRet;
}

uint32_t CWheelNavigator::GetTrackingEngineID(void)
{
	return m_ActiveEngineID;
}

bool CWheelNavigator::cbSetEngine(wheels::cmd_set_navigator_engineRequest &req,
									wheels::cmd_set_navigator_engineResponse &res)
{
	res.nLastEngineID = m_ActiveEngineID;
	if (m_pTrackingEngine != NULL)
		res.strLastEngineDescription = m_pTrackingEngine->GetEngineDescription();
	else
		res.strLastEngineDescription = "";	
	res.nRetCode = SetTrackingEngine(req.nNewEngineID);
	if (res.nRetCode > 0)
	{
		res.nActiveEngineID = req.nNewEngineID;
		if (m_pTrackingEngine != NULL)
			res.strActiveEngineDescription = m_pTrackingEngine->GetEngineDescription();
		else
			res.strActiveEngineDescription = "";			
	}
	return true;
}

bool CWheelNavigator::cbGetEngineStatus(wheels::cmd_get_navigator_engine_statusRequest &req,
										wheels::cmd_get_navigator_engine_statusResponse &res)
{
	res.nActiveEngineID = m_ActiveEngineID;
	if (m_pTrackingEngine != NULL)
		res.strActiveEngineDescription = m_pTrackingEngine->GetEngineDescription();
	else
		res.strActiveEngineDescription = "";	
	res.nRetCode = 1;
	
	return true;
}

void CWheelNavigator::PublishEngineStatus(void)
{
	wheels::navigator_engine_status status;

	status.nActiveEngineID = m_ActiveEngineID;
	if (m_pTrackingEngine != NULL)
		status.strActiveEngineDescription = m_pTrackingEngine->GetEngineDescription();
	else
		status.strActiveEngineDescription = "";
	
	m_EngineStatusPublisher.publish(status);	
}

int32_t CWheelNavigator::ProcessCmdVels(const geometry_msgs::Twist &velMsg)
{
	//printf("Navigator publish: z=%f, x=%f\n", velMsg.angular.z, velMsg.linear.x);
	m_WheelCmdVelPublisher.publish(velMsg);
	return 1;
}
}
