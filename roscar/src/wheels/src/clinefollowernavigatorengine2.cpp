#include "clinefollowernavigatorengine2.h"
#include "vector"
#include <opencv2/highgui/highgui.hpp>
#include "GRANSAC.hpp"

namespace yisys_roswheels
{
CLineFollowerNavigatorEngine2::CLineFollowerNavigatorEngine2()
{
	m_bPaused = true;
	m_pHoughStorage = NULL;
	m_FrameSize.width = 0;
	m_FrameSize.height = 0;
	m_HalfFrameSize.width = 0;
	m_HalfFrameSize.height = 0;

	//cvInitFont(&m_Font, CV_FONT_VECTOR0, 0.5f, 0.5f);
	m_pWorkingImage = NULL;
	m_pGreyImage = NULL;
	m_pEdgesImage = NULL;

	m_bShowLine = true;

	m_fTurnAngle = 0.f;
	m_VanishingPoint.x = 0;
	m_VanishingPoint.y = 0;
}

CLineFollowerNavigatorEngine2::~CLineFollowerNavigatorEngine2()
{
	if (m_pHoughStorage != NULL)
		cvReleaseMemStorage(&m_pHoughStorage);

	if (m_pGreyImage != NULL)
		cvReleaseImage(&m_pGreyImage);

	if (m_pEdgesImage != NULL)
		cvReleaseImage(&m_pEdgesImage);

	if (m_pWorkingImage != NULL)
		cvReleaseImage(&m_pWorkingImage);
}

int32_t CLineFollowerNavigatorEngine2::Init(void)
{
	return 1;
}

int32_t CLineFollowerNavigatorEngine2::Start(void)
{
	m_bPaused = false;
	return 1;
}

int32_t CLineFollowerNavigatorEngine2::Pause(void)
{
	m_bPaused = true;
	return 1;
}

// here, we prefer to find two parallel lines which represents single lane which robot to follow
// first, we check how many lines found, then fit those lines with similar slope.
//
void CLineFollowerNavigatorEngine2::ProcessLanes(CvSeq* lines, IplImage* pEdges, IplImage *pWorkingImage, bool bShowHoughLine, float fLastSlope, float fLastB)
{
    printf("Found lines: %d\n", lines->total);
    if (lines->total <= 0)
    {
        m_fTurnAngle = 0.;
        return;
    }
    else if (lines->total == 1)
    {
        CvPoint* line = (CvPoint*)cvGetSeqElem(lines, 0);
        m_fTurnAngle = 90 - atan2(line[1].y - line[0].y, line[1].x - line[0].x) * 180 / CV_PI;
        m_VanishingPoint = line[1];
        if (bShowHoughLine)
        {
            cvLine(pWorkingImage, line[0], line[1], CV_RGB(0, 0, 255), 2);
        }
        return;
    }
    else
    {
        std::vector<std::shared_ptr<GRANSAC::AbstractParameter>> CandLines;
        GRANSAC::RANSAC<MyLine2DModel, 1> Estimator;
        GRANSAC::InlinerListType BestInliers;

        for (int i = 0; i < lines->total; i++)
        {
            CvPoint* line = (CvPoint*)cvGetSeqElem(lines, i);

            std::shared_ptr<GRANSAC::AbstractParameter> CandLine = std::make_shared<MyLine2D>(line[0], line[1]);
            CandLines.push_back(CandLine);
            if (bShowHoughLine)
            {
                cvLine(pWorkingImage, line[0], line[1], CV_RGB(0, 255, 0), 2);
            }
        }
        #if 1
        std::vector<std::shared_ptr<GRANSAC::AbstractParameter>>::iterator itLine;

        for (itLine = CandLines.begin(); itLine != CandLines.end(); itLine++)
        {
            std::shared_ptr<yisys_roswheels::MyLine2D> CandLine = std::dynamic_pointer_cast<MyLine2D>(*itLine);

            printf("CanLine: angle=%f, length=%f, slope=%f (%d, %d), (%d, %d)\n", CandLine->m_fAngle, CandLine->m_fLength, CandLine->m_Slope, CandLine->m_Point1.x, CandLine->m_Point1.y, CandLine->m_Point2.x, CandLine->m_Point2.y);
        }
        #endif
        Estimator.Initialize(10, 100); // Threshold, iterations
        Estimator.Estimate(CandLines);

        {
            BestInliers = Estimator.GetBestInliers();

            if (BestInliers.size() > 0)
            {
                printf("Total inliner: %lu\n", BestInliers.size());
                // here, we found several line with similar slope.
                // from those lines, we need to get vanishing point and turn angle
                GRANSAC::InlinerListType::iterator itInLiner;
                m_fTurnAngle = 0;
                m_VanishingPoint.x = 0;
                m_VanishingPoint.y = 0;
                for (itInLiner = BestInliers.begin(); itInLiner != BestInliers.end(); itInLiner++)
                {
                    std::shared_ptr<yisys_roswheels::MyLine2D> RPt = std::dynamic_pointer_cast<MyLine2D>(*itInLiner);
                    //cv::Point Pt(floor(RPt->m_Point2D[0]), floor(RPt->m_Point2D[1]));
                    //cv::circle(Canvas, Pt, floor(Side / 100), cv::Scalar(0, 255, 0), -1);
                    m_fTurnAngle += RPt->m_fAngle;
                    m_VanishingPoint.x += (RPt->m_Point1.x + RPt->m_Point2.x) / 2;
                    m_VanishingPoint.y += (RPt->m_Point1.y + RPt->m_Point2.y) / 2;

                    if (bShowHoughLine)
                    {
                        cvLine(pWorkingImage, RPt->m_Point1, RPt->m_Point2, CV_RGB(0, 0, 255), 2);
                    }
                    printf("Inliner: angle:%f, (%d, %d)\n", RPt->m_fAngle, RPt->m_Point1.x, RPt->m_Point1.y);
                }

                std::shared_ptr<MyLine2DModel> bestmodel = Estimator.GetBestModel();

                std::array<std::shared_ptr<GRANSAC::AbstractParameter>, 1> bestParam = bestmodel->GetModelParams();

                std::array<std::shared_ptr<GRANSAC::AbstractParameter>, 1>::iterator itparam;
                for (itparam = bestParam.begin(); itparam != bestParam.end(); itparam++)
                {
                    std::shared_ptr<yisys_roswheels::MyLine2D> param = std::dynamic_pointer_cast<MyLine2D>(*itparam);

                    printf("best model param: slope=%f, length=%f, angle=%f, (%d, %d) (%d, %d)\n", param->m_Slope, param->m_fLength, param->m_fAngle, param->m_Point1.x, param->m_Point1.y, param->m_Point2.x, param->m_Point2.y);
                }

                m_fTurnAngle /= BestInliers.size();
                m_VanishingPoint.x /= BestInliers.size();
                m_VanishingPoint.y /= BestInliers.size();

                float dY = -(m_VanishingPoint.y - m_HalfFrameSize.height);
                float dX = -(m_VanishingPoint.x - m_HalfFrameSize.width / 2);

                float dShiftAngle = atan2(dY, dX) * 180 / CV_PI - 90;

                float fFinalAngle = (m_fTurnAngle + dShiftAngle) / 2;
                printf("turn angle:%f, shift-angle=%f, lineangle=%f, (%d, %d)\n", fFinalAngle, dShiftAngle, m_fTurnAngle, m_VanishingPoint.x, m_VanishingPoint.y);

                m_fTurnAngle = fFinalAngle;
                if (bShowHoughLine)
                {
                    CvPoint basePt;
                    basePt.x = m_HalfFrameSize.width / 2;
                    basePt.y = m_HalfFrameSize.height;
                    cvCircle(pWorkingImage, m_VanishingPoint, 4, CV_RGB(255, 0, 0));
                    cvLine(pWorkingImage, m_VanishingPoint, basePt, CV_RGB(255, 255, 0), 1);
                }
            }

        }
    }
    /*
	if (bShowHoughLine)
	{
		// show Hough lines
		for	(int i=0; i<right.size(); i++)
		{
			cvLine(pWorkingImage, right[i].m_p0, right[i].m_p1, CV_RGB(0, 0, 255), 2);
		}

		for	(int i=0; i<left.size(); i++)
		{
			cvLine(pWorkingImage, left[i].m_p0, left[i].m_p1, CV_RGB(255, 0, 0), 2);
		}
	}
	*/
}
int32_t CLineFollowerNavigatorEngine2::ProcessImage(IplImage *pFrame, bool bDisplayImage, float &fAngle, CvPoint &vanishingPoint)
//int32_t CLineFollowerNavigatorEngine2::ProcessFrame(IplImage *pFrame, float &fAngle, CvPoint &vanishingPoint)
{
	int32_t nRet = -1;
	double rho = 1;
	double theta = CV_PI / 180;
	CvSeq* pLines = NULL;

	if (pFrame == NULL)
	{
		goto err_out;
	}
	if (m_FrameSize.width == 0 || m_FrameSize.height == 0)
	{
		m_FrameSize.width = pFrame->width;
		m_FrameSize.height = pFrame->height;

		m_HalfFrameSize.width = pFrame->width;
		m_HalfFrameSize.height = pFrame->height / 2;

		m_ROI = cvRect(0, m_HalfFrameSize.height, m_HalfFrameSize.width, m_HalfFrameSize.height);
	}
	else
	{
		if (m_FrameSize.width != pFrame->width || m_FrameSize.height != pFrame->height)
		{
			goto err_out;
		}
	}

	if (m_pHoughStorage == NULL)
	{
		m_pHoughStorage = cvCreateMemStorage(0);
	}

	if (m_pWorkingImage == NULL)
	{
		m_pWorkingImage = cvCreateImage(m_HalfFrameSize, IPL_DEPTH_8U, 3);
	}

	if (m_pGreyImage == NULL)
	{
		m_pGreyImage = cvCreateImage(m_HalfFrameSize, IPL_DEPTH_8U, 1);
	}

	if (m_pEdgesImage == NULL)
	{
		m_pEdgesImage = cvCreateImage(m_HalfFrameSize, IPL_DEPTH_8U, 1);
	}

	// we're interested only in road below horizont - so crop top image portion off
	crop(pFrame, m_pWorkingImage, m_ROI);
	cvCvtColor(m_pWorkingImage, m_pGreyImage, CV_BGR2GRAY); // convert to grayscale

	// Perform a Gaussian blur ( Convolving with 5 X 5 Gaussian) & detect edges
	cvSmooth(m_pGreyImage, m_pGreyImage, CV_GAUSSIAN, 9, 9);
	cvCanny(m_pGreyImage, m_pEdgesImage, L2_CANNY_MIN_TRESHOLD, L2_CANNY_MAX_TRESHOLD, 3);

	// do Hough transform to find lanes

	pLines = cvHoughLines2(m_pEdgesImage, m_pHoughStorage, CV_HOUGH_PROBABILISTIC,
									rho, theta, m_HalfFrameSize.height / 2, m_HalfFrameSize.height / 2, L2_HOUGH_MAX_LINE_GAP);

	// here, we prefer
	ProcessLanes(pLines, m_pEdgesImage, m_pWorkingImage, m_bShowLine, 0, 0);

	fAngle = m_fTurnAngle;
	vanishingPoint = m_VanishingPoint;

	if (bDisplayImage)
	{
		cvShowImage("Lane-Detector::Edges", m_pEdgesImage);
		cvShowImage("Lane-Detector::ColorImage", m_pWorkingImage);

        PublishDebugImage("mono8", m_pEdgesImage);

		PublishDebugImage("bgr8", m_pWorkingImage);
	}
	else
	{
		cvDestroyWindow("Lane-Detector::Edges");
		cvDestroyWindow("Lane-Detector::ColorImage");
	}
	nRet = 1;
#if DEBUGIMG
	cvShowImage("Grey", m_pGreyImage);
	cvShowImage("Edges", m_pEdgesImage);
	cvShowImage("Color", m_pWorkingImage);

	cvMoveWindow("Grey", 0, 0);
	cvMoveWindow("Edges", 0, m_HalfFrameSize.height + 25);
	cvMoveWindow("Color", 0, 2*(m_HalfFrameSize.height + 25));
#endif
err_out:
	return nRet;
}

}
