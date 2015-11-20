#include "stdio.h"

#include "opencv2/highgui/highgui.hpp"
#include "opticalflow_ov.h"
#include "myutil.h"

CObstacleDetection::CObstacleDetection()
{
	m_SubPixWinSize = cv::Size(10, 10);
	m_WinSize = cv::Size(31, 31);
	
	m_Termcrit = cv::TermCriteria(cv::TermCriteria::COUNT | cv::TermCriteria::EPS, 20, 0.03);
	m_bNeedInit = false;
}

CObstacleDetection::~CObstacleDetection()
{
}

void CObstacleDetection::Reset(void)
{
	m_Points[0].clear();
	m_Points[1].clear();
}

int32_t CObstacleDetection::ProcessFrame(IplImage *pImage, float &fLeftWeight, float &fRightWeight)
{
	int32_t nRet = -1;
	
	// convert to grey
	m_ColorSource = cv::Mat(pImage, true);
	
    cv::cvtColor(m_ColorSource, m_ThisGrey, cv::COLOR_BGR2GRAY);
    
    if (m_bNeedInit == false && m_Points[0].size() <= LESSPOINT_COUNT)
    {
		m_bNeedInit = true;
	}
	if (m_bNeedInit || (m_Points[0].empty()))
	{
		goodFeaturesToTrack(m_ThisGrey, m_Points[1], MAX_COUNT, 0.01, 10, cv::Mat(), 3, 0, 0.04);
        cornerSubPix(m_ThisGrey, m_Points[1], m_SubPixWinSize, cv::Size(-1,-1), m_Termcrit);
	}
	else if (m_Points[0].empty() == false)
	{
		std::vector<uchar> status;
		std::vector<float> err;
		
		if (m_PrevGrey.empty())
			m_ThisGrey.copyTo(m_PrevGrey);
			
		calcOpticalFlowPyrLK(m_PrevGrey, m_ThisGrey, m_Points[0], m_Points[1], status, err, m_WinSize,
								3, m_Termcrit, 0, 0.001);

		size_t i, k;
		int nHalfSize = pImage->width / 2;
		fLeftWeight = 0.0f;
		fRightWeight = 0.0f;		
		for (i = k = 0; i < m_Points[1].size(); i++)
		{
			if (!status[i])
				continue;

			
			m_Points[1][k++] = m_Points[1][i];
			//cv::circle(m_ColorSource, m_Points[1][i], 3, cv::Scalar(0, 255, 0), -1, 8);
			//cvCircle(pImage, m_Points[1][i], 3, cvScalar(0, 255, 0));
			cv::line(m_ColorSource, m_Points[0][i], m_Points[1][i], cv::Scalar(255, 255, 0));
			
			float x = m_Points[0][i].x - m_Points[1][i].x;
			float y = m_Points[0][i].y - m_Points[1][i].y;
			float fD = (x * x + y * y);
			
			if (m_Points[0][i].x < nHalfSize)
			{
				fLeftWeight += fD;
			}
			else
			{
				fRightWeight += fD;
			}
		}//
		m_Points[1].resize(k);
	}
	m_bNeedInit = false;
	
	std::swap(m_Points[1], m_Points[0]);
	cv::swap(m_PrevGrey, m_ThisGrey);
	
	cv::imshow("Optical flow", m_ColorSource);
	printf("LeftWeight:%6.2f, RightWeight:%6.2f\n", fLeftWeight, fRightWeight);
err_out:
	return nRet;
}
	
