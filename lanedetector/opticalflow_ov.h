#ifndef __OPTICALFLOW_OBSTACLE_H__
#define __OPTICALFLOW_OBSTACLE_H__
#pragma once
#include "opencv2/imgproc/imgproc.hpp"
#include <opencv2/opencv.hpp>
#include <math.h>
#include "vector"
#define MAX_COUNT 500
#define LESSPOINT_COUNT 100
class CObstacleDetection
{
	
public:
	CObstacleDetection();
	virtual ~CObstacleDetection();
	
	int32_t ProcessFrame(IplImage *pImage, float &pLeftWeight, float &fRightWeight);
	
	void ForceInit(bool bForce) { m_bNeedInit; };
	void Reset(void);
protected:
	bool m_bNeedInit;
	std::vector<cv::Point2f> m_Points[2];
	cv::Mat m_ThisGrey;
	cv::Mat m_PrevGrey;
	cv::Mat m_ColorSource;
	cv::TermCriteria m_Termcrit;
    cv::Size m_SubPixWinSize, m_WinSize;
	
};
#endif
