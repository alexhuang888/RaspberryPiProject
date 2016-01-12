#ifndef __CLINEFOLLOWERNAVIGATORENGINE2_H__
#define __CLINEFOLLOWERNAVIGATORENGINE2_H__

#pragma once
#include <opencv2/core/core.hpp>
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
		GRANSAC::VPFloat fAngleDiff = fabs(ExtLine2D->m_fAngle - m_Params.m_fAngle);
        float lengthdiff = fabs(ExtLine2D->m_fLength - m_Params.m_fLength) / m_Params.m_fLength;
        float fDist = fAngleDiff / 90 * 5 + lengthdiff * 5;
        float fLineDistance = 0;
        //float fSlopeDiff = fabs(m_Params.m_Slope) - fabs(ExtLine2D->m_Slope);

        // if two lines are not from the same "line band" or
        // if two lines has big length difference, or
        // if input line is almost horizontal
        if (fAngleDiff > 30 || (lengthdiff >= 0.5) || fabs(ExtLine2D->m_fAngle) > 80)
            fDist += 100;

        //if (fAngleDiff < 5)   // treat it as parallel lines (angle difference less than 5 degrees)
        if (fDist < 100)
        {
            //fLineDistance = fabs(ExtLine2D->m_B - m_Params.m_B) / sqrt(ExtLine2D->m_Slope * ExtLine2D->m_Slope + 1);
            float fY = (ExtLine2D->m_Point1.y + ExtLine2D->m_Point2.y + m_Params.m_Point1.y + m_Params.m_Point2.y) / 4;

            float fX1 = ExtLine2D->m_Slope != 0 ? (fY - ExtLine2D->m_B) / ExtLine2D->m_Slope : 0;
            float fX2 = m_Params.m_Slope != 0 ? (fY - m_Params.m_B) / m_Params.m_Slope : 0;
            float fD = fX2 - fX1;

            fLineDistance = sqrt((fD * fD));

            //printf("m1=%f, m2=%f, distance=%f\n", ExtLine2D->m_Slope, m_Params.m_Slope, fLineDistance);
            if (fLineDistance < 40 || fLineDistance > 240)
            {
                // to eliminate two close parallel lines. or if two lines are too far-away
                fDist += 100;
            }
        }
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

	L2_CANNY_MIN_TRESHOLD = 50,	  // edge detector minimum hysteresis threshold
	L2_CANNY_MAX_TRESHOLD = 150, // edge detector maximum hysteresis threshold

	L2_HOUGH_TRESHOLD = 50,		// line approval vote threshold
	L2_HOUGH_MIN_LINE_LENGTH = 50,	// remove lines shorter than this treshold
	L2_HOUGH_MAX_LINE_GAP = 50,   // join lines to one with smaller than this gaps

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
	CvMemStorage* m_pHoughStorage;
	CvSize m_FrameSize;
	CvSize m_ROIFrameSize;
	CvRect m_ROI;
	IplImage *m_pWorkingImage, *m_pGreyImage, *m_pEdgesImage;
	bool m_bShowLine;
	float m_fTurnAngle;
	CvPoint m_VanishingPoint;
protected:

	bool m_bPaused;
};
};
#endif
