#include "stdio.h"
#include <iostream>
#include <ctime>
#include <cstdlib>
#include <fstream>
#include <sstream>
#include "raspicam/raspicam_cv.h"
#include "opencv2/imgproc/imgproc.hpp"
using namespace std;
#include "unistd.h"
#include <termios.h>
int mygetch ( void )
{
  int ch;
  struct termios oldt, newt;

  tcgetattr ( STDIN_FILENO, &oldt );
  newt = oldt;
  newt.c_lflag &= ~( ICANON | ECHO );
  tcsetattr ( STDIN_FILENO, TCSANOW, &newt );
  ch = getchar();
  tcsetattr ( STDIN_FILENO, TCSANOW, &oldt );

  return ch;
}

bool doTestSpeedOnly=false;
//parse command line
//returns the index of a command line param in argv. If not found, return -1
int findParam ( string param,int argc,char **argv ) {
    int idx=-1;
    for ( int i=0; i<argc && idx==-1; i++ )
        if ( string ( argv[i] ) ==param ) idx=i;
    return idx;

}
//parse command line
//returns the value of a command line param. If not found, defvalue is returned
float getParamVal ( string param,int argc,char **argv,float defvalue=-1 ) {
    int idx=-1;
    for ( int i=0; i<argc && idx==-1; i++ )
        if ( string ( argv[i] ) ==param ) idx=i;
    if ( idx==-1 ) return defvalue;
    else return atof ( argv[  idx+1] );
}

void processCommandLine ( int argc,char **argv,raspicam::RaspiCam_Cv &Camera ) {
    Camera.set ( CV_CAP_PROP_FRAME_WIDTH,  getParamVal ( "-w",argc,argv,1280 ) );
    Camera.set ( CV_CAP_PROP_FRAME_HEIGHT, getParamVal ( "-h",argc,argv,960 ) );
    Camera.set ( CV_CAP_PROP_BRIGHTNESS,getParamVal ( "-br",argc,argv,50 ) );
    Camera.set ( CV_CAP_PROP_CONTRAST ,getParamVal ( "-co",argc,argv,50 ) );
    Camera.set ( CV_CAP_PROP_SATURATION, getParamVal ( "-sa",argc,argv,50 ) );
    Camera.set ( CV_CAP_PROP_GAIN, getParamVal ( "-g",argc,argv ,50 ) );
    if ( findParam ( "-gr",argc,argv ) !=-1 )
        Camera.set ( CV_CAP_PROP_FORMAT, CV_8UC1 );
    if ( findParam ( "-test_speed",argc,argv ) !=-1 )
        doTestSpeedOnly=true;
    if ( findParam ( "-ss",argc,argv ) !=-1 )
        Camera.set ( CV_CAP_PROP_EXPOSURE, getParamVal ( "-ss",argc,argv )  );
    if ( findParam ( "-wb_r",argc,argv ) !=-1 )
        Camera.set ( CV_CAP_PROP_WHITE_BALANCE_RED_V,getParamVal ( "-wb_r",argc,argv )     );
    if ( findParam ( "-wb_b",argc,argv ) !=-1 )
        Camera.set ( CV_CAP_PROP_WHITE_BALANCE_BLUE_U,getParamVal ( "-wb_b",argc,argv )     );


//     Camera.setSharpness ( getParamVal ( "-sh",argc,argv,0 ) );
//     if ( findParam ( "-vs",argc,argv ) !=-1 )
//         Camera.setVideoStabilization ( true );
//     Camera.setExposureCompensation ( getParamVal ( "-ev",argc,argv ,0 ) );


}

void showUsage() {
    cout<<"Usage: "<<endl;
    cout<<"[-gr set gray color capture]\n";
    cout<<"[-test_speed use for test speed and no images will be saved]\n";
    cout<<"[-w width] [-h height] \n[-br brightness_val(0,100)]\n";
    cout<<"[-co contrast_val (0 to 100)]\n[-sa saturation_val (0 to 100)]";
    cout<<"[-g gain_val  (0 to 100)]\n";
    cout<<"[-ss shutter_speed (0 to 100) 0 auto]\n";
    cout<<"[-wb_r val  (0 to 100),0 auto: white balance red component]\n";
    cout<<"[-wb_b val  (0 to 100),0 auto: white balance blue component]\n";

    cout<<endl;
}
int main ( int argc,char **argv )
 {
    if ( argc==1 )
	{
        cerr<<"Usage (-help for help)"<<endl;
    }
    if ( findParam ( "-help",argc,argv ) !=-1 ) {
        showUsage();
        return -1;
    }

    raspicam::RaspiCam_Cv Camera;
    Camera.set ( CV_CAP_PROP_FORMAT, CV_8UC1 );
	Camera.set ( CV_CAP_PROP_FRAME_WIDTH, 640);
    Camera.set ( CV_CAP_PROP_FRAME_HEIGHT, 480);
    processCommandLine ( argc,argv,Camera );
    cout<<"Connecting to camera"<<endl;
    if ( !Camera.open() ) {
        cerr<<"Error opening camera"<<endl;
        return -1;
    }
    cout<<"Connected to camera ="<<Camera.getId() <<endl;

    cv::Mat image;
    int nCount=0;
    int i = 0;
    cout<<"Capturing"<<endl;

    double time_=cv::getTickCount();
	char szFilename[100] = "";
	char nkey = 0;
    //for ( int i=0; i<nCount; i++ )
    cv::Rect roi(0, 190, 640, 100);
    cv::Mat roiImg, erodeElmt, dilateElmt;
    int thVal = 128;
    vector<vector<cv::Point> > contours;
    vector<cv::Vec4i> hierarchy;
    do
    {
		try {
			Camera.grab();
			Camera.retrieve(image);

			image(roi).copyTo(roiImg);
		} catch (...)
		{
			printf("Fail to grab/retrieve/copy image\n");
		}
		printf("threshold image\n");
        cv::threshold(roiImg, roiImg, thVal, 255, 0);
        printf("bitwise_not image\n");
        cv::bitwise_not(roiImg, roiImg); // negative image

		erodeElmt = cv::getStructuringElement(cv::MORPH_RECT, cv::Size(3, 3));
		dilateElmt = cv::getStructuringElement(cv::MORPH_RECT, cv::Size(5, 5));
		printf("erode image\n");
		cv::erode(roiImg, roiImg, erodeElmt);
		printf("dilate image\n");
		cv::dilate(roiImg, roiImg, dilateElmt);
		contours.clear();
		hierarchy.clear();
		printf("findContours image\n");
		cv::findContours(roiImg, contours, hierarchy, CV_RETR_TREE, CV_CHAIN_APPROX_SIMPLE, cv::Point(0,0));

		for (size_t s = 0; s < contours.size(); s++)
		{
			float fArea = cv::contourArea(contours[s]);

			if (fArea > 2000)
			{
				cv::Moments mu;
				mu = cv::moments(contours[s], false);
				cv::Point2f center(mu.m10 / mu.m00, mu.m01 / mu.m00); // point in center (x only)
				//cv::circle(camera, center, 5, Scalar(0, 255, 0), -1, 8, 0);
				printf("Find a region: Area=%f, center(%f, %f)\n", fArea, center.x, center.y);

				if (i % 50 == 0 && i != 0)
				{
					try {
						cv::circle(roiImg, center, 5, cv::Scalar(255, 255, 255), -1, 8, 0);
					} catch (...)
					{
						printf("Fail to write out a circle\n");
					}
					sprintf(szFilename, "roi_image%d.jpg", i);
					try {
						//cv::imwrite(szFilename, roiImg);
					} catch (...)
					{
						printf("Fail to write out image\n");
					}
				}
			}
		}

        i++;
        nkey = cv::waitKey(10);
        //printf("Key press: %d %c\n", nkey, nkey);
    } while (nkey != 'q');

    if ( !doTestSpeedOnly )  cout<<endl<<"Images saved in imagexx.jpg"<<endl;
    double secondsElapsed= double ( cv::getTickCount()-time_ ) /double ( cv::getTickFrequency() ); //time in second
    cout<< secondsElapsed<<" seconds for "<< nCount<<"  frames : FPS = "<< ( float ) ( ( float ) ( nCount ) /secondsElapsed ) <<endl;
    Camera.release();

}
