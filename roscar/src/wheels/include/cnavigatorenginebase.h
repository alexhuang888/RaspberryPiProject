#ifndef __CNAVIGATORENGINEBASE_H__
#define __CNAVIGATORENGINEBASE_H__

#include <ros/ros.h>
#include <ros/package.h>
#include <sensor_msgs/image_encodings.h>
#include <sensor_msgs/Image.h>
#include <sensor_msgs/CameraInfo.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/Twist.h>
//#include "Undistorter.h"

namespace yisys_roswheels
{
class CNavigatorCallback
{
public:
	virtual int32_t ProcessCmdVels(const geometry_msgs::Twist &velMsg) = 0;
};
// a virtual class for navigator engien
class CNavigatorEngineBase
{
public:
	CNavigatorEngineBase() { m_pNavigatorCB = NULL;};
	virtual ~CNavigatorEngineBase() {m_pNavigatorCB = NULL;};
	
	virtual int32_t Init(void) = 0;
	virtual int32_t Start(void) = 0;
	virtual int32_t Pause(void) = 0;
	
	virtual uint32_t GetEngineID(void) = 0;
	virtual std::string GetEngineDescription(void) = 0;
	
	virtual int32_t ProcessCmdVels(const geometry_msgs::Twist &velMsg)
	{
		if (m_pNavigatorCB != NULL)
		{
			return m_pNavigatorCB->ProcessCmdVels(velMsg);
		}
		return 0;
	};
	int32_t SetNavigatorCallback(CNavigatorCallback *pCB)
	{
		m_pNavigatorCB = pCB;
		return 1;
	};
protected:
	CNavigatorCallback *m_pNavigatorCB;
};

class CNavigatorEngineWithImageSource : public CNavigatorEngineBase
{
public:
	CNavigatorEngineWithImageSource();
	virtual ~CNavigatorEngineWithImageSource();
	
	virtual int32_t Init(void) = 0;
	virtual int32_t Start(void) = 0;
	virtual int32_t Pause(void) = 0;
	virtual uint32_t GetEngineID(void) = 0;
	virtual std::string GetEngineDescription(void) = 0;
	
	virtual int32_t setCalibration(std::string file);

	virtual int32_t ProcessImageData(const sensor_msgs::ImageConstPtr img) { return 1; };

	// get called on ros-message callbacks
	virtual void vidCb(const sensor_msgs::ImageConstPtr img);
	virtual void infoCb(const sensor_msgs::CameraInfoConstPtr info);
	/**
	 * Gets the Camera Calibration. To avoid any dependencies, just as simple float / int's.
	 */
	inline float fx() {return m_fx;}
	inline float fy() {return m_fy;}
	inline float cx() {return m_cx;}
	inline float cy() {return m_cy;}
	inline int width() {return m_nWidth;}
	inline int height() {return m_nHeight;}
	
protected:

	float m_fx, m_fy, m_cx, m_cy;
	int32_t m_nWidth, m_nHeight;


	bool m_bHaveCalibration;
	//Undistorter* m_pUndistorter;


	std::string m_strVidChannel;
	ros::Subscriber m_VidSubscriber;	
	
private:
	ros::NodeHandle m_nImageBaseNodeHandle;
};
};
#endif
