#ifndef __CLINEFOLLOWERNAVIGATORENGINE_H__
#define __CLINEFOLLOWERNAVIGATORENGINE_H__

#pragma once
#include "opencv2/imgproc/imgproc.hpp"
#include "cnavigatorenginebase.h"
namespace yisys_roswheels
{
/*
 * in this class, it will get camera data from image_raw message, then process it to get estimated speed and direction
 * for the wheel
 */
#define TESTROI 0
#define PRESERVEROI 0
#define THRESHOLDIMAGE 1

#define CAMERA_IMG_WIDTH 640
#define CAMERA_IMG_HEIGHT 480
#define IMGTHRESHOLD 127
#define MAXAREATHRESHOLD 1000

#define WEID_LINEFOLLOWERENGINE 1
#define WESTR_LINEFOLLOWERENGINE "Line Follower"

class CLineFollowerNavigatorEngine : public CNavigatorEngineWithImageSource
{
public:
	CLineFollowerNavigatorEngine();
	virtual ~CLineFollowerNavigatorEngine();
	
	virtual int32_t Init(void);
	virtual int32_t Start(void);
	virtual int32_t Pause(void);
	
	virtual int32_t ProcessImageData(const sensor_msgs::ImageConstPtr img, bool bDisplayImage);
	
	virtual uint32_t GetEngineID(void) { return WEID_LINEFOLLOWERENGINE; };
	virtual std::string GetEngineDescription(void) { return WESTR_LINEFOLLOWERENGINE;} ;	
protected:
	int32_t FindLineCenter(cv::Mat &InputImage, int32_t nTick, int32_t &nCenterX, int32_t &nCenterY);
	int32_t FindOffset(int32_t nCenterX, int32_t nCenterY, float &fXOffset, float &fYOffset);
	int32_t OffsetNavigator(float fXOffset);
protected:
	
	bool m_bPaused;
};
};
#endif
