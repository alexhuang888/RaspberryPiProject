/*
 * Raspberry Pi GPIO example using sysfs interface.
 * Guillermo A. Amaral B. <g@maral.me>
 *
 * This file blinks GPIO 4 (P1-07) while reading GPIO 24 (P1_18).
 */
 
#include <sys/stat.h>
#include <sys/types.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
 
#include "gpio.h"
 
int
GPIOExport(int pin)
{
#define RPI_GPIO_BUFFER_MAX 3
	char buffer[RPI_GPIO_BUFFER_MAX];
	ssize_t bytes_written;
	int fd;
 
	fd = open("/sys/class/gpio/export", O_WRONLY);
	if (-1 == fd) {
		fprintf(stderr, "Failed to open export for writing!\n");
		return(-1);
	}
 
	bytes_written = snprintf(buffer, RPI_GPIO_BUFFER_MAX, "%d", pin);
	write(fd, buffer, bytes_written);
	close(fd);
	return(1);
}
 
int
GPIOUnexport(int pin)
{
	char buffer[RPI_GPIO_BUFFER_MAX];
	ssize_t bytes_written;
	int fd;
 
	fd = open("/sys/class/gpio/unexport", O_WRONLY);
	if (-1 == fd) {
		//fprintf(stderr, "Failed to open unexport for writing!\n");
		return(-1);
	}
 
	bytes_written = snprintf(buffer, RPI_GPIO_BUFFER_MAX, "%d", pin);
	write(fd, buffer, bytes_written);
	close(fd);
	return(1);
}
 
int
GPIODirection(int pin, int dir)
{
	static const char s_directions_str[]  = "in\0out";
 
#define RPI_GPIO_DIRECTION_MAX 35
	char path[RPI_GPIO_DIRECTION_MAX];
	int fd;
 
	snprintf(path, RPI_GPIO_DIRECTION_MAX, "/sys/class/gpio/gpio%d/direction", pin);
	fd = open(path, O_WRONLY);
	if (-1 == fd) {
		//fprintf(stderr, "Failed to open gpio direction for writing!\n");
		return(-1);
	}
 
	if (-1 == write(fd, &s_directions_str[RPI_GPIO_IN == dir ? 0 : 3], RPI_GPIO_IN == dir ? 2 : 3)) {
		//fprintf(stderr, "Failed to set direction!\n");
		return(-1);
	}
 
	close(fd);
	return(1);
}
 
int
GPIORead(int pin)
{
#define RPI_GPIO_VALUE_MAX 30
	char path[RPI_GPIO_VALUE_MAX];
	char value_str[3];
	int fd;
 
	snprintf(path, RPI_GPIO_VALUE_MAX, "/sys/class/gpio/gpio%d/value", pin);
	fd = open(path, O_RDONLY);
	if (-1 == fd) {
		//fprintf(stderr, "Failed to open gpio value for reading!\n");
		return(-1);
	}
 
	if (-1 == read(fd, value_str, 3)) {
		//fprintf(stderr, "Failed to read value!\n");
		return(-1);
	}
 
	close(fd);
 
	return(atoi(value_str));
}
 
int
GPIOWrite(int pin, int value)
{
	static const char s_values_str[] = "01";
 
	char path[RPI_GPIO_VALUE_MAX];
	int fd;
 
	snprintf(path, RPI_GPIO_VALUE_MAX, "/sys/class/gpio/gpio%d/value", pin);
	fd = open(path, O_WRONLY);
	if (-1 == fd) {
		//fprintf(stderr, "Failed to open gpio value for writing!\n");
		return(-1);
	}
 
	if (1 != write(fd, &s_values_str[RPI_GPIO_LOW == value ? 0 : 1], 1)) {
		//fprintf(stderr, "Failed to write value!\n");
		return(-1);
	}
 
	close(fd);
	return(1);
}
 
