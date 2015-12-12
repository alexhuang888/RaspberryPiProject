#include "cnavigatorenginebase.h"
#include <ros/callback_queue.h>

#include <boost/thread.hpp>
#include <opencv2/highgui/highgui.hpp>

#include "cv_bridge/cv_bridge.h"

#include <iostream>
#include <fstream>
#include "globalinc.h"
using namespace cv;
namespace yisys_roswheels
{
CNavigatorEngineWithImageSource::CNavigatorEngineWithImageSource()
{
	// subscribe
	m_strVidChannel = m_nImageBaseNodeHandle.resolveName("image");
	printf("Resolve name for image=%s\n", m_strVidChannel.c_str());
	
	m_VidSubscriber = m_nImageBaseNodeHandle.subscribe(m_strVidChannel, 1, &CNavigatorEngineWithImageSource::vidCb, this);


	// wait for cam calib
	m_nWidth = m_nHeight = 0;

	// imagebuffer
	//m_pImageBuffer = new NotifyBuffer<TimestampedMat>(8);
	//m_pUndistorter = NULL;
	//m_nLastSEQ = 0;

	m_bHaveCalibration = false;	
}

CNavigatorEngineWithImageSource::~CNavigatorEngineWithImageSource()
{
	//if (m_pUndistorter != NULL)
	//	delete m_pUndistorter;
	//m_pUndistorter = NULL;
}


int32_t CNavigatorEngineWithImageSource::setCalibration(std::string file)
{
	int32_t nRet = 0;
	
	if (file == "")
	{
		ros::Subscriber info_sub = m_nImageBaseNodeHandle.subscribe(m_nImageBaseNodeHandle.resolveName("camera_info"),
															1, 
															&CNavigatorEngineWithImageSource::infoCb, this);

		printf("WAITING for ROS camera calibration!\n");
		while (m_nWidth == 0)
		{
			ros::getGlobalCallbackQueue()->callAvailable(ros::WallDuration(0.03));
		}
		printf("RECEIVED ROS camera calibration!\n");

		info_sub.shutdown();

	}
	else
	{
		/*
		m_pUndistorter = Undistorter::getUndistorterForFile(file.c_str());

		if (m_pUndistorter == NULL)
		{
			printf("Failed to read camera calibration from file... wrong syntax?\n");
		}
		else
		{
			m_fx = m_pUndistorter->getK().at<double>(0, 0);
			m_fy = m_pUndistorter->getK().at<double>(1, 1);
			m_cx = m_pUndistorter->getK().at<double>(2, 0);
			m_cy = m_pUndistorter->getK().at<double>(2, 1);

			m_nWidth = m_pUndistorter->getOutputWidth();
			m_nHeight = m_pUndistorter->getOutputHeight();
		}
		*/
	}
	nRet = 1;
	m_bHaveCalibration = true;
	
err_out:
	return nRet;
}

// get called on ros-message callbacks
void CNavigatorEngineWithImageSource::vidCb(const sensor_msgs::ImageConstPtr img)
{
	#if 0
	if (!m_bHaveCalibration)
		return;
	#endif
	
	bool bDisplayImage = false;
	
	m_nImageBaseNodeHandle.param<bool>(WGP_DEBUG_SHOWIMAGE, bDisplayImage, false);
	//printf("Show Debug Image=%s\n", bDisplayImage ? "Yes" : "No");
	ProcessImageData(img, bDisplayImage);
/*
	cv_bridge::CvImagePtr cv_ptr = cv_bridge::toCvCopy(img, sensor_msgs::image_encodings::MONO8);

	if (img->header.seq < (unsigned int)m_nLastSEQ)
	{
		printf("Backward-Jump in SEQ detected, but ignoring for now.\n");
		m_nLastSEQ = 0;
		return;
	}
	m_nLastSEQ = img->header.seq;

	TimestampedMat bufferItem;
	if(img->header.stamp.toSec() != 0)
		bufferItem.timestamp =  Timestamp(img->header.stamp.toSec());
	else
		bufferItem.timestamp =  Timestamp(ros::Time::now().toSec());

	if(m_pUndistorter != 0)
	{
		assert(m_pUndistorter->isValid());
		m_pUndistorter->undistort(cv_ptr->image,bufferItem.data);
	}
	else
	{
		bufferItem.data = cv_ptr->image;
	}

	m_pImageBuffer->pushBack(bufferItem);	
*/
}

void CNavigatorEngineWithImageSource::infoCb(const sensor_msgs::CameraInfoConstPtr info)
{
	if (!m_bHaveCalibration)
	{
		m_fx = info->P[0];
		m_fy = info->P[5];
		m_cx = info->P[2];
		m_cy = info->P[6];

		if (m_fx == 0 || m_fy == 0)
		{
			printf("camera calib from P seems wrong, trying calib from K\n");
			m_fx = info->K[0];
			m_fy = info->K[4];
			m_cx = info->K[2];
			m_cy = info->K[5];
		}

		m_nWidth = info->width;
		m_nHeight = info->height;

		printf("Received ROS Camera Calibration: fx: %f, fy: %f, cx: %f, cy: %f @ %dx%d\n",m_fx,m_fy,m_cx,m_cy,m_nWidth,m_nHeight);
	}	
}
}
