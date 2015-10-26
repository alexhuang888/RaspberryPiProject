/*
Raspberry pi wheels controller
*/

class CL298NMotorController
{
private:
	CL298NMotorController(){};
public:
	CL298NMotorController(uint32_t nForwardPinID, uint32_t nBackwardPinID)
	{
		m_nSpeed = 0;
		m_nDirection = 0;
		m_nHealthyStatus = 0;
		m_nForwardPinID = nForwardPinID;
		m_nbackwardPinID = nBackwardPinID;
	};
	virtual ~CL298NMotorController();
	
	uint32_t GetSpeed(void) { return m_nSpeed; };
	int32_t GetDirection(void) { return m_nDirection; };
	uint32_t GetHealthyStatus(void)  { return m_nHealthyStatus; };
	
	int32_t SetSpeedAndDirection(uint32_t nNewSpeed, int32_t nNewDirection);
	
	int32_t Reset(void);
	void GetGPIOPinID(uint32_t &nForwardPinID, uint32_t &nBackwardPinID);
	
protected:
	uint32_t m_nSpeed;	// 0 - 100
	int32_t m_nDirection;	// 0: Forward, 1: backward
	uint32_t m_nHealthyStatus:	// 0: unknown, 1: healthy
	
	uint32_t m_nForwardPinID;
	uint32_t m_nBackwardPinID;
};

class CTwoWheelsController
{
private:
	CTwoWheelsController() {};
public:
	CTwoWheelsController(int nLeftForwardPin, int nLeftBackwardPin, int nRightForwardPin, int nRightBackwardPin);
	virtual ~CTwoWheelsController();
		
public:
	int32_t GetTotalMotors(void);
	int32_t Forward(uint32_t nSpeed);
	int32_t Backward(uint32_t nSpeed);
	int32_t TurnRight(uint32_t nSpeed, int32_t nForwardBackward);
	int32_t TurnLeft(uint32_t nSpeed, int32_t nForwardBackward);
	
	int32_t Stop(void);
	int32_t Reset(void);
	
protected:
	CMotorController &GetMotorControllers(uint32_t nWheelID);

protected:
	map<int32_t, *CL298NMotorController> m_Motors;
	int32_t m_Direction;	// 
	int32_t m_Speed;	// 0 - 100
};
