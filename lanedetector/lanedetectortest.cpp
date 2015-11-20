#include <stdio.h>
#include "CLaneFinder.h"
#include "opencv2/highgui/highgui.hpp"
#include "opticalflow_ov.h"

#define USE_VIDEO 1
#define TRACK_CAR 0
#undef MIN
#undef MAX
#define MAX(a,b) ((a)<(b)?(b):(a))
#define MIN(a,b) ((a)>(b)?(b):(a))

int main(int argc, char* argv[])
{
#ifdef USE_VIDEO
	CvCapture *input_video = cvCreateFileCapture(argv[1]);
#else
	CvCapture *input_video = cvCaptureFromCAM(0);
#endif

	if (input_video == NULL) 
	{
		fprintf(stderr, "Error: Can't open video\n");
		return -1;
	}

	CLaneFinder lf;
	
	int key_pressed = 0;
	IplImage *frame = NULL;
	bool bShowHoughLine = false;
	float fAngle = 0.0f;
	CvPoint vanishingPoint;
	float fLeftWeight = 0.f, fRightWeight = 0.f;
	CObstacleDetection od;
	bool bDoCarDetect = false;
	
	while(key_pressed != 27) 
	{
		printf("\x1B[2J\x1B[H");
		if (key_pressed == 's')
		{
			bShowHoughLine = !bShowHoughLine;
			lf.ShowLine(bShowHoughLine);
		}
		if (key_pressed == 'c')
		{
			bDoCarDetect = !bDoCarDetect;
		}
		frame = cvQueryFrame(input_video);
		if (frame == NULL) 
		{
			fprintf(stderr, "Error: null frame received\n");
			return -1;
		}

		lf.ProcessFrame(frame, fAngle, vanishingPoint);
		if (bDoCarDetect)
		{
			od.ProcessFrame(frame, fLeftWeight, fRightWeight);
		}
		key_pressed = cvWaitKey(10);		
	}

	cvReleaseCapture(&input_video);
}
