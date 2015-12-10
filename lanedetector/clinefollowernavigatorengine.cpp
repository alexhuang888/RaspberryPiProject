#include "clinefollowernavigatorengine.h"
#include "vector"
#include "opencv2/highgui/highgui.hpp"
#include "stdio.h" 	
//namespace yisys_roswheels

CLineFollowerNavigatorEngine::CLineFollowerNavigatorEngine()
{	
	m_bPaused = true;
}

CLineFollowerNavigatorEngine::~CLineFollowerNavigatorEngine()
{
}
	
int32_t CLineFollowerNavigatorEngine::Init(void)
{
	return 1;
}

int32_t CLineFollowerNavigatorEngine::Start(void)
{
	m_bPaused = false;
	return 1;
}

int32_t CLineFollowerNavigatorEngine::Pause(void)
{
	m_bPaused = true;
	return 1;
}

int32_t CLineFollowerNavigatorEngine::ProcessImageData(IplImage *pWorkingImage)
{
	int nRet = 0;
	
	if (m_bPaused == true)
	{
		nRet = 1;
		return nRet;
	}
	//cv_bridge::CvImagePtr cv_ptr = cv_bridge::toCvCopy(img, sensor_msgs::image_encodings::MONO8);
	cv::Mat grayCVMat;
	cv::Mat workingCVMat(pWorkingImage);
	
	///workingCVMat = *pWorkingImage;
	m_nWidth = workingCVMat.cols;
	m_nHeight = workingCVMat.rows;
	cv::cvtColor(workingCVMat, grayCVMat, CV_BGR2GRAY); // convert to grayscale
	/*
	if (m_pUndistorter != 0)
	{
		assert(m_pUndistorter->isValid());
		m_pUndistorter->undistort(cv_ptr->image, workingCVMat);
	}
	else
	*/
	{
		
	}
	
	//printf("workingCVMat: depth=%d, channels=%d, dims=%d, (%dx%d)\n", workingCVMat.depth(), workingCVMat.channels(), workingCVMat.dims, workingCVMat.rows, workingCVMat.cols);
	// process this gray-scale data
	int32_t nCenterX = 0, nCenterY = 0;
	float fOffsetX = 0, fOffsetY = 0;
	
	nRet = FindLineCenter(grayCVMat, 0, nCenterX, nCenterY);
	
	if (nRet <= 0)
	{
		printf("Fail to find line center\n");
		goto err_out;
	}
		
	nRet = FindOffset(nCenterX, nCenterY, fOffsetX, fOffsetY);
	if (nRet <= 0)
	{
		printf("Fail to find offset\n");
		goto err_out;
	}
		
	nRet = OffsetNavigator(fOffsetX);
	if (nRet <= 0)
	{
		printf("Fail to OffsetNavigator\n");
		goto err_out;	
	}	
err_out:
	return nRet;
}

int32_t CLineFollowerNavigatorEngine::FindLineCenter(cv::Mat &InputImage, int32_t nTick, int32_t &nCenterX, int32_t &nCenterY)
{
	char szFilename[100] = "";
	char szOriFilename[100];
#if PRESERVEROI
	char szOriROIFilename[100];
	cv::Mat roiImgPreserve;
#endif

	m_nHeight = InputImage.rows;
	m_nWidth = InputImage.cols;
	
    cv::Rect roi(0, m_nHeight * 3 / 4, m_nWidth, m_nHeight / 4);
    cv::Mat roiImg, erodeElmt, dilateElmt;
    int thVal = IMGTHRESHOLD;
    std::vector<std::vector<cv::Point> > contours;
    std::vector<cv::Vec4i> hierarchy;
 
	int nRet = -1;
	nCenterX = m_nWidth / 2;
	nCenterY = m_nHeight / 2;
	
    {
		try {		
			InputImage(roi).copyTo(roiImg);
			#if PRESERVEROI
				roiImg.copyTo(roiImgPreserve);
			#endif
		} catch (cv::Exception& e)
		{
			const char* err_msg = e.what();
			std::cout << "exception caught: " << err_msg << std::endl;
		}
		
#if THRESHOLDIMAGE
		try {
			//printf("threshold image\n");
			cv::threshold(roiImg, roiImg, thVal, 255, cv::THRESH_BINARY);
						
			//printf("bitwise_not image\n");
			//cv::bitwise_not(roiImg, roiImg); // negative image
			
			erodeElmt = cv::getStructuringElement(cv::MORPH_RECT, cv::Size(3, 3));
			dilateElmt = cv::getStructuringElement(cv::MORPH_RECT, cv::Size(5, 5));
			//printf("erode image\n");
			cv::erode(roiImg, roiImg, erodeElmt);
			//printf("dilate image\n");
			cv::dilate(roiImg, roiImg, dilateElmt); 
		}
		catch (...)
		{
			printf("Fail to threhold image\n");
		}
#endif 		
#if TESTROI		
		{
			sprintf(szFilename, "roi_image%d.png", nTick);
			sprintf(szOriFilename, "image%d.png", nTick);
			try {
				cv::drawContours(roiImg, contours, s, cv::Scalar(255, 255, 255), 2, 8, hierarchy, 0, cv::Point() );
				//cv::imwrite(szFilename, roiImg);
				//cv::imwrite(szOriFilename, InputImage);
			} catch (cv::Exception& e)
			{
				const char* err_msg = e.what();
				std::cout << "exception caught: " << err_msg << std::endl;
			}
		}	
#endif	
#if !TESTROI
		//printf("findContours image\n");
		try {
			cv::findContours(roiImg, contours, hierarchy, CV_RETR_TREE, CV_CHAIN_APPROX_SIMPLE, cv::Point(0,0));
		} catch (...)
		{
			printf("Fail to findContours\n");
		}
		int nMaxAreaContourIndex = -1;
		float fMaxArea = 0.f;
		
		for (size_t s = 0; s < contours.size(); s++) 
		{
			float fArea = cv::contourArea(contours[s]);
			if (fArea > fMaxArea)
			{
				nMaxAreaContourIndex = s;
				fMaxArea = fArea;
			}
		}
		printf("total contours: %lu, MaxArea found: %f, index=%d\n", contours.size(), fMaxArea, nMaxAreaContourIndex);
		{
			if (fMaxArea > MAXAREATHRESHOLD && nMaxAreaContourIndex >= 0) 
			{
				cv::Moments mu;
				try {
					mu = cv::moments(contours[nMaxAreaContourIndex], false);
				} catch (...)
				{
					printf("Fail to find moments\n");
				}
				cv::Point2f center(mu.m10 / mu.m00, mu.m01 / mu.m00); // point in center (x only)   
				printf("Find a region: Area=%f, center(%f, %f)\n", fMaxArea, center.x, center.y);
				
				nCenterX = (int32_t)center.x;
				nCenterY = (int32_t)center.y;
				nRet = 1;
				// here is the center pixel
#if 1
				{
					try {
						cv::circle(roiImg, center, 5, cv::Scalar(255, 255, 255), -1, 8, 0);
					} catch (cv::Exception& e)
					{
						const char* err_msg = e.what();
						std::cout << "exception caught: " << err_msg << std::endl;
					}
					sprintf(szFilename, "roi_image%d.png", nTick);
					sprintf(szOriFilename, "image%d.png", nTick);
					try {
						cv::drawContours(roiImg, contours, nMaxAreaContourIndex, cv::Scalar(255, 255, 255), 2, 8, hierarchy, 0, cv::Point());
						//cv::imwrite(szFilename, roiImg);
						//cv::imwrite(szOriFilename, image);
						cv::imshow("LineFollower", roiImg);
#if PRESERVEROI
						sprintf(szOriROIFilename, "ori_roi_image%d.png", nTick);
						//cv::imwrite(szOriROIFilename, roiImgPreserve);
						cv::imshow("roiOriginal", InputImage);
#endif						
					} catch (cv::Exception& e)
					{
						const char* err_msg = e.what();
						std::cout << "exception caught: " << err_msg << std::endl;
					}
				}
#endif				
			}
		}
#endif
    }
err_out:
    return nRet;
}

int32_t CLineFollowerNavigatorEngine::FindOffset(int32_t nCenterX, int32_t nCenterY, float &fXOffset, float &fYOffset)
{
	int32_t nRet = 0;
	
	fXOffset = 0;
	fYOffset = 0;
	float nHalfWidth = m_nWidth / 2.f;
	
	fXOffset = (nCenterX - nHalfWidth) / nHalfWidth;
	nRet = 1;
	
	return nRet;
}

int32_t CLineFollowerNavigatorEngine::OffsetNavigator(float fXOffset)
{
	int32_t nRet = 0;
	
	//geometry_msgs::Twist vel_msg;
	float fX = 0, fZ = 0;
	
	float fDir = 1.;
	
	if (fXOffset > 0)
		fDir = 1;	// turn right
	else
		fDir = -1;	// turn left
	if (fabs(fXOffset) < 0.2)
		fDir = 0;
		
	fZ = fabs(fXOffset);
	fX = 0.3;
	
	fZ *= fDir;
	
/*		
	if (fabs(fXOffset) > 0.2 && fabs(fXOffset) < 0.4)	// If the offset is more than 30% on either side from the center of the image
	{
		srv2.request.nNewSpeed = 60;	// max speed;
	}
	else if(fabs(fXOffset) > 0.4 && fabs(fXOffset) < 0.6)	// If the offset is more than 50% on either side from the center of the image
	{
		srv2.request.nNewSpeed = 65;	// max speed;
	}
	else if(fabs(fXOffset) > 0.6 && fabs(fXOffset) < 0.8)	// If the offset is more than 70% on either side from the center of the image
	{
		srv2.request.nNewSpeed = 70;	// max speed;	
	}
	else if(fabs(fXOffset) > 0.8)	// If the offset is more than 90% on either side from the center of the image
	{
		srv2.request.nNewSpeed = 75;	// max speed;	
	}
	else	// Move forward with the specified speed by the user
	{
		srv2.request.nNewSpeed = 60;	// max speed;		
		srv2.request.nNewDirection = 1;	// forward
	}	
	*/
	
	//m_WheelCmdVelPublisher.publish(vel_msg);
	//ProcessCmdVels(vel_msg);
	printf("Publish: z=%f, x=%f\n", fZ, fX);
	nRet = 1;
	return nRet;	
}


