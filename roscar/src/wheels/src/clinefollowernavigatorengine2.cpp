#include "clinefollowernavigatorengine2.h"
#include "vector"
#include "myutil.h"
#include <opencv2/highgui/highgui.hpp>
#include "GRANSAC.hpp"

namespace yisys_roswheels
{
#define _CL2_SHOWDEBUGMSG 1
CLineFollowerNavigatorEngine2::CLineFollowerNavigatorEngine2()
{
	m_bPaused = true;
	m_pHoughStorage = NULL;
	m_FrameSize.width = 0;
	m_FrameSize.height = 0;
	m_ROIFrameSize.width = 0;
	m_ROIFrameSize.height = 0;

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
#if _CL2_SHOWDEBUGMSG
    printf("Found hough lines: %d\n", lines->total);
#endif
    if (lines->total <= 0)
    {
        m_fTurnAngle = 0.;
        return;
    }
    else if (lines->total == 1)
    {
        CvPoint* line = (CvPoint*)cvGetSeqElem(lines, 0);
        MyLine2D myline(line[1], line[0]);

        if (fabs(myline.m_fAngle) < 75) // almost horizontal line
        {
            m_fTurnAngle = myline.m_fAngle;//90 - atan2(line[1].y - line[0].y, line[1].x - line[0].x) * 180 / CV_PI;
            m_VanishingPoint.x = (myline.m_Point1.x + myline.m_Point2.x) / 2;
            m_VanishingPoint.y = (myline.m_Point1.y + myline.m_Point2.y) / 2;

            if (bShowHoughLine)
            {
                cvLine(pWorkingImage, line[0], line[1], CV_RGB(0, 0, 255), 2);
            }
            printf("*turn angle:%f, (%d, %d)\n", m_fTurnAngle, m_VanishingPoint.x, m_VanishingPoint.y);
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

            std::shared_ptr<yisys_roswheels::MyLine2D> checkLine = std::dynamic_pointer_cast<MyLine2D>(CandLine);

            if (fabs(checkLine->m_fAngle) < 75)
            {
                CandLines.push_back(CandLine);
                if (bShowHoughLine)
                {
                    cvLine(pWorkingImage, line[0], line[1], CV_RGB(0, 255, 0), 3);
                }
            }
            else
            {
                if (bShowHoughLine)
                {
                    cvLine(pWorkingImage, line[0], line[1], CV_RGB(0, 0, 0), 3);
                }
#if _CL2_SHOWDEBUGMSG
                printf("*");
#endif // _CL2_SHOWDEBUGMSG
            }
#if _CL2_SHOWDEBUGMSG
            printf("HoughLine: ang=%f, len=%f, m=%f, b=%f (%d, %d), (%d, %d)\n", checkLine->m_fAngle, checkLine->m_fLength, checkLine->m_Slope, checkLine->m_B, checkLine->m_Point1.x, checkLine->m_Point1.y, checkLine->m_Point2.x, checkLine->m_Point2.y);
#endif
        }
#if _CL2_SHOWDEBUGMSG
        printf("Total Candidate line before RANSAC:%zu\n", CandLines.size());
#endif
        Estimator.Initialize(10, 100); // Threshold, iterations
        Estimator.Estimate(CandLines);

        {
            BestInliers = Estimator.GetBestInliers();

            if (BestInliers.size() > 0)
            {
                int nTotalCounts = 0;
                int nVXMin = m_ROIFrameSize.width;
                int nVXMax = 0;
                int nVYMin = m_ROIFrameSize.height;
                int nVYMax = 0;
#if _CL2_SHOWDEBUGMSG
                printf("Total inliner: %zu\n", BestInliers.size());
#endif
                // here, we found several line with similar slope.
                // from those lines, we need to get vanishing point and turn angle
                GRANSAC::InlinerListType::iterator itInLiner;
                m_fTurnAngle = 0;
                m_VanishingPoint.x = 0;
                m_VanishingPoint.y = 0;
                for (itInLiner = BestInliers.begin(); itInLiner != BestInliers.end(); itInLiner++)
                {
                    std::shared_ptr<yisys_roswheels::MyLine2D> RPt = std::dynamic_pointer_cast<MyLine2D>(*itInLiner);

                    m_fTurnAngle += RPt->m_fAngle;
                    nVXMin = std::min(nVXMin, int((RPt->m_Point1.x + RPt->m_Point2.x) / 2));
                    nVXMax = std::max(nVXMax, int((RPt->m_Point1.x + RPt->m_Point2.x) / 2));

                    nVYMin = std::min(nVYMin, int((RPt->m_Point1.y + RPt->m_Point2.y) / 2));
                    nVYMax = std::max(nVYMax, int((RPt->m_Point1.y + RPt->m_Point2.y) / 2));

                    if (bShowHoughLine)
                    {
                        cvLine(pWorkingImage, RPt->m_Point1, RPt->m_Point2, CV_RGB(0, 0, 255), 1);
                    }
#if _CL2_SHOWDEBUGMSG
                    printf("Inliner: ang:%f, m=%f, b=%f, (%d, %d)(%d, %d)\n", RPt->m_fAngle, RPt->m_Slope, RPt->m_B, RPt->m_Point1.x, RPt->m_Point1.y, RPt->m_Point2.x, RPt->m_Point2.y);
#endif
                    nTotalCounts++;
                }

                std::shared_ptr<MyLine2DModel> bestmodel = Estimator.GetBestModel();

                std::array<std::shared_ptr<GRANSAC::AbstractParameter>, 1> bestParam = bestmodel->GetModelParams();

                std::array<std::shared_ptr<GRANSAC::AbstractParameter>, 1>::iterator itparam;
                for (itparam = bestParam.begin(); itparam != bestParam.end(); itparam++)
                {
                    std::shared_ptr<yisys_roswheels::MyLine2D> param = std::dynamic_pointer_cast<MyLine2D>(*itparam);
#if _CL2_SHOWDEBUGMSG
                    printf("model: ang=%f, m=%f, b=%f, (%d, %d) (%d, %d)\n", param->m_fAngle, param->m_Slope, param->m_B, param->m_Point1.x, param->m_Point1.y, param->m_Point2.x, param->m_Point2.y);
#endif
                    m_fTurnAngle += param->m_fAngle;

                    nVXMin = std::min(nVXMin, int((param->m_Point1.x + param->m_Point2.x) / 2));
                    nVXMax = std::max(nVXMax, int((param->m_Point1.x + param->m_Point2.x) / 2));

                    nVYMin = std::min(nVYMin, int((param->m_Point1.y + param->m_Point2.y) / 2));
                    nVYMax = std::max(nVYMax, int((param->m_Point1.y + param->m_Point2.y) / 2));
                    nTotalCounts++;
                    if (bShowHoughLine)
                    {
                        cvLine(pWorkingImage, param->m_Point1, param->m_Point2, CV_RGB(255, 0, 0), 1);
                    }
                }
                if (nTotalCounts > 0)
                {
                    m_fTurnAngle /= nTotalCounts;
                    m_VanishingPoint.x = (nVXMin + nVXMax) / 2;
                    m_VanishingPoint.y = (nVYMin + nVYMax) / 2;
                }

                float dY = -(m_VanishingPoint.y - m_ROIFrameSize.height);
                float dX = -(m_VanishingPoint.x - m_ROIFrameSize.width / 2);

                // angle by vanishing point
                float dShiftAngle = atan2(dY, dX) * 180 / CV_PI - 90;

                // average of inliners and shift-angle
                float fFinalAngle = (m_fTurnAngle + dShiftAngle) / 2;
#if 1
                printf("turn angle:%f, shift-angle=%f, lineangle=%f, (%d, %d)\n", fFinalAngle, dShiftAngle, m_fTurnAngle, m_VanishingPoint.x, m_VanishingPoint.y);
#endif
                m_fTurnAngle = fFinalAngle;
                if (bShowHoughLine)
                {
                    CvPoint basePt;
                    basePt.x = m_ROIFrameSize.width / 2;
                    basePt.y = m_ROIFrameSize.height;
                    cvCircle(pWorkingImage, m_VanishingPoint, 4, CV_RGB(255, 0, 0));
                    cvLine(pWorkingImage, m_VanishingPoint, basePt, CV_RGB(255, 255, 0), 1);
                }
            }
        }
    }
}
int32_t CLineFollowerNavigatorEngine2::ProcessImage(IplImage *pFrame, bool bDisplayImage, float &fAngle, CvPoint &vanishingPoint)
{
	int32_t nRet = -1;
	double rho = 1;
	double theta = CV_PI / 180;
	CvSeq* pLines = NULL;
	double dMedian = 128;
	double dSigma = 0.33;
    int32_t canny_T_lower = 0;
	int32_t canny_T_upper = 255;
	int32_t nHoughThreshold = 100;
	int32_t nHoughLines = 0;

	if (pFrame == NULL)
	{
		goto err_out;
	}

#define ROIRATIO 2
	if (m_FrameSize.width == 0 || m_FrameSize.height == 0)
	{
		m_FrameSize.width = pFrame->width;
		m_FrameSize.height = pFrame->height;

		m_ROIFrameSize.width = pFrame->width;
		m_ROIFrameSize.height = pFrame->height / ROIRATIO;

		m_ROI = cvRect(0, m_FrameSize.height * (ROIRATIO - 1) / ROIRATIO, m_ROIFrameSize.width, m_ROIFrameSize.height);
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
		m_pWorkingImage = cvCreateImage(m_ROIFrameSize, IPL_DEPTH_8U, 3);
	}

	if (m_pGreyImage == NULL)
	{
		m_pGreyImage = cvCreateImage(m_ROIFrameSize, IPL_DEPTH_8U, 1);
	}

	if (m_pEdgesImage == NULL)
	{
		m_pEdgesImage = cvCreateImage(m_ROIFrameSize, IPL_DEPTH_8U, 1);
	}

	// we're interested only in road below horizont - so crop top image portion off
	crop(pFrame, m_pWorkingImage, m_ROI);
	cvCvtColor(m_pWorkingImage, m_pGreyImage, CV_BGR2GRAY); // convert to grayscale
	// Perform a Gaussian blur ( Convolving with 3 X 3 Gaussian) & detect edges
	cvSmooth(m_pGreyImage, m_pGreyImage, CV_GAUSSIAN, 9, 9);

	dMedian = medianIplImage(m_pGreyImage, 256);
	dSigma = 0.33;
    canny_T_lower = int32_t(std::max(0., (1.0 - dSigma) * dMedian));
	canny_T_upper = int32_t(std::min(255., (1.0 + dSigma) * dMedian));
	//cvCanny(m_pGreyImage, m_pEdgesImage, L2_CANNY_MIN_TRESHOLD, L2_CANNY_MAX_TRESHOLD, 3);
	cvCanny(m_pGreyImage, m_pEdgesImage, canny_T_lower, canny_T_upper, 3);

	// do Hough transform to find lines

	nHoughLines = 0;
	nHoughThreshold = 20;//m_ROIFrameSize.height * 0.4;

	//while (nHoughLines < 5 && nHoughThreshold > 4)
	{
        pLines = cvHoughLines2(m_pEdgesImage, m_pHoughStorage, CV_HOUGH_PROBABILISTIC,
                                        rho, theta, nHoughThreshold,
                                        m_ROIFrameSize.height * 0.4,
                                        L2_HOUGH_MAX_LINE_GAP);

    }



	// here, we prefer some lines
	ProcessLanes(pLines, m_pEdgesImage, m_pWorkingImage, m_bShowLine, 0, 0);

	fAngle = m_fTurnAngle;
	vanishingPoint = m_VanishingPoint;

	if (bDisplayImage)
	{
		cvShowImage("Lane-Detector::Edges", m_pEdgesImage);
		cvShowImage("Lane-Detector::ColorImage", m_pWorkingImage);

        //PublishDebugImage("mono8", m_pEdgesImage);

		//PublishDebugImage("bgr8", m_pWorkingImage);
	}
	else
	{
		cvDestroyWindow("Lane-Detector::Edges");
		cvDestroyWindow("Lane-Detector::ColorImage");
	}
	nRet = 1;

err_out:
	return nRet;
}

}
