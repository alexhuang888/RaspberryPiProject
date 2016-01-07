#ifndef __CLINEFOLLOWERNAVIGATORENGINE2_H__
#define __CLINEFOLLOWERNAVIGATORENGINE2_H__

#pragma once
#include "opencv2/imgproc/imgproc.hpp"
#include <opencv2/core/core.hpp>
#include "myutil.h"
#include "claneinfo.h"
#include "AbstractModel.hpp"
#include "cnavigatorengineimplementationbase.h"

namespace yisys_roswheels
{


class MyLine2D
    : public GRANSAC::AbstractParameter
{
public:

    MyLine2D()
    {
    };

    MyLine2D(CvPoint p1, CvPoint p2)
    {
		m_Point1 = p1;
		m_Point2 = p2;

		// Compute the line parameters
		float diffX = p2.x - p1.x;
		float diffY = p2.y - p1.y;

        if (diffY < 0)
        {
            diffX = p1.x - p2.x;
            diffY = p1.y - p2.y;
        }
		if (diffX != 0)
			m_Slope = diffY / diffX; // Slope
		else
			m_Slope = 0;

		m_B = p1.y - m_Slope * p1.x; // Intercept

		m_fLength = sqrt(diffX * diffX + diffY * diffY);
        m_fAngle = atan2(diffY, diffX) * 180 / CV_PI - 90;
    };

    CvPoint m_Point1;
    CvPoint m_Point2;
    float m_fLength;
    float m_fAngle;
    float m_Slope, m_B;
};

class MyLine2DModel
    : public GRANSAC::AbstractModel<1>
{
protected:
    // Parametric form
	MyLine2D m_Params;

    virtual GRANSAC::VPFloat ComputeDistanceMeasure(std::shared_ptr<GRANSAC::AbstractParameter> inParam)
    {
		std::shared_ptr<yisys_roswheels::MyLine2D> ExtLine2D = std::dynamic_pointer_cast<MyLine2D>(inParam);

		// distance is theta between two lines with some preforma
		// two line with similar length

        // distance 0 - 180
        //printf("ext_angle=%f, param_angle=%f\n", ExtLine2D->m_fAngle, m_Params.m_fAngle);
		GRANSAC::VPFloat fAngle = fabs(ExtLine2D->m_fAngle - m_Params.m_fAngle);
        float lengthdiff = fabs(ExtLine2D->m_fLength - m_Params.m_fLength) / m_Params.m_fLength;
        float fDist = fAngle / 90 * 5 + lengthdiff * 5;
        if (fAngle > 30 || (lengthdiff >= 0.5))
            fDist += 100;
		return fDist;
    };

public:
    MyLine2DModel(std::vector<std::shared_ptr<GRANSAC::AbstractParameter>> InputParams)
    {
		Initialize(InputParams);
    };

    virtual void Initialize(std::vector<std::shared_ptr<GRANSAC::AbstractParameter>> InputParams)
    {
		if (InputParams.size() != 1)
			throw std::runtime_error("Line2DModel - Number of input parameters does not match minimum number required for this model.");

		// Check for AbstractParamter types
		std::shared_ptr<yisys_roswheels::MyLine2D> ExtLine = std::dynamic_pointer_cast<MyLine2D>(InputParams[0]);

		if (ExtLine == NULL)
			throw std::runtime_error("Line2DModel - InputParams type mismatch. It is not a MyPoint2D.");

		std::copy(InputParams.begin(), InputParams.end(), m_MinModelParams.begin());

		m_Params = *ExtLine;
    };

    virtual std::pair<GRANSAC::VPFloat, std::vector<std::shared_ptr<GRANSAC::AbstractParameter>>> Evaluate(std::vector<std::shared_ptr<GRANSAC::AbstractParameter>> EvaluateParams, GRANSAC::VPFloat Threshold)
    {
		std::vector<std::shared_ptr<GRANSAC::AbstractParameter>> Inliers;
		int nTotalParams = EvaluateParams.size();
		int nInliers = 0;

		std::vector<std::shared_ptr<GRANSAC::AbstractParameter>>::iterator itParam;

		//for (auto& Param : EvaluateParams)
		for (itParam = EvaluateParams.begin(); itParam != EvaluateParams.end(); itParam++)
		{
            float fMeasure = ComputeDistanceMeasure(*itParam);
			if (fMeasure < Threshold)
			{
				Inliers.push_back(*itParam);
				nInliers++;
			}
		}

		GRANSAC::VPFloat InlierFraction = GRANSAC::VPFloat(nInliers) / GRANSAC::VPFloat(nTotalParams); // This is the inlier fraction

		return std::make_pair(InlierFraction, Inliers);
    };
};


/*
 * in this class, it will get camera data from image_raw message, then process it to get estimated speed and direction
 * for the wheel
 */
#define TESTROI 0
#define PRESERVEROI 1
#define THRESHOLDIMAGE 1

#define CAMERA_IMG_WIDTH 640
#define CAMERA_IMG_HEIGHT 480
#define IMGTHRESHOLD 127
#define MAXAREATHRESHOLD 5000

#define WEID_LINEFOLLOWERENGINE2 3
#define WESTR_LINEFOLLOWERENGINE2 "Line Follower2"
enum{
    L2_SCAN_STEP = 5,			  // in pixels
	L2_LINE_REJECT_DEGREES = 10, // in degrees
    L2_BW_TRESHOLD = 250,		  // edge response strength to recognize for 'WHITE'
    L2_BORDERX = 10,			  // px, skip this much from left & right borders
	L2_MAX_RESPONSE_DIST = 5,	  // px

	L2_CANNY_MIN_TRESHOLD = 80,	  // edge detector minimum hysteresis threshold
	L2_CANNY_MAX_TRESHOLD = 240, // edge detector maximum hysteresis threshold

	L2_HOUGH_TRESHOLD = 50,		// line approval vote threshold
	L2_HOUGH_MIN_LINE_LENGTH = 50,	// remove lines shorter than this treshold
	L2_HOUGH_MAX_LINE_GAP = 10,   // join lines to one with smaller than this gaps

	L2_CAR_DETECT_LINES = 4,    // minimum lines for a region to pass validation as a 'CAR'
	L2_CAR_H_LINE_LENGTH = 10,  // minimum horizontal line length from car body in px

	L2_MAX_VEHICLE_SAMPLES = 30,      // max vehicle detection sampling history
	L2_CAR_DETECT_POSITIVE_SAMPLES = L2_MAX_VEHICLE_SAMPLES-2, // probability positive matches for valid car
	L2_MAX_VEHICLE_NO_UPDATE_FREQ = 15 // remove car after this much no update frames
};
class CLineFollowerNavigatorEngine2 : public CNavigatorEngineImplementationBase
{
public:
	CLineFollowerNavigatorEngine2();
	virtual ~CLineFollowerNavigatorEngine2();

	virtual int32_t Init(void);
	virtual int32_t Start(void);
	virtual int32_t Pause(void);
    virtual bool IsPaused(void) { return m_bPaused; }
    virtual int32_t ProcessImage(IplImage *pFrame, bool bDisplayImage, float &fAngle, CvPoint &vanishingPoint);
	virtual uint32_t GetEngineID(void) { return WEID_LINEFOLLOWERENGINE2; };
	virtual std::string GetEngineDescription(void) { return WESTR_LINEFOLLOWERENGINE2;} ;
protected:
	int32_t FindLineCenter(cv::Mat &InputImage, int32_t nTick, int32_t &nCenterX, int32_t &nCenterY);
	int32_t FindOffset(int32_t nCenterX, int32_t nCenterY, float &fXOffset, float &fYOffset);
	int32_t OffsetNavigator(float fXOffset);
    void ProcessLanes(CvSeq* lines, IplImage* pEdges, IplImage *pWorkingImage, bool bShowHoughLine, float fLastSlope, float fLastB);
protected:
	// left and right lane
	//CLaneStatus m_LaneR, m_LaneL;
	CvMemStorage* m_pHoughStorage;
	CvSize m_FrameSize;
	CvSize m_HalfFrameSize;
	CvRect m_ROI;
	//CvFont m_Font;
	IplImage *m_pWorkingImage, *m_pGreyImage, *m_pEdgesImage;
	bool m_bShowLine;
	float m_fTurnAngle;
	CvPoint m_VanishingPoint;
protected:

	bool m_bPaused;
};
};
#endif
