/*
RPi GPIO basic I/O
Oct/19/2015, Alex Huang
*/
#define RPI_GPIO_IN  0
#define RPI_GPIO_OUT 1
 
#define RPI_GPIO_LOW  0
#define RPI_GPIO_HIGH 1

 
extern int
GPIOExport(int pin);

extern int
GPIOUnexport(int pin);
 
extern int
GPIODirection(int pin, int dir);
 
extern int
GPIORead(int pin);
 
extern int
GPIOWrite(int pin, int value);
 
