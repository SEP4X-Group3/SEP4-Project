/*
 * Configuration.c
 *
 * Created: 5/25/2022 11:14:41 AM
 *  Author: Lukas
 */ 

/*Configuration.c is a shared resource class that holds the norm
* values for CO2, Temperature and humidity
*/

#include <stdio.h>
#include <stdint.h>
#include <../GoogleTesting/FreeRTOS.h>
#include <../GoogleTesting/semphr.h>
#include <../GoogleTesting/event_groups.h>
#include <../GoogleTesting/message_buffer.h>



#include "Configuration.h"

//Variables for norms of:
//CO2 measurements
uint16_t co2Norm;
//Temperature measurements
uint16_t tempNorm;
//Humidity measurements
uint16_t humNorm;

//Mutex handle
SemaphoreHandle_t configMutex;

/*
* Function for initializing the mutex of configuration class,
* and the norm default values
*/
void createConfiguration(){
	co2Norm = 1000;
	tempNorm = 0x1A;
	humNorm = 1000;
	configMutex = xSemaphoreCreateMutex();
	xSemaphoreGive(configMutex);
}

//Getters for norm values
uint16_t getCo2Norm()
{
	return co2Norm;
}
uint16_t getTempNorm()
{
	return tempNorm;
}
uint16_t getHumNorm()
{
	return humNorm;
}

//Setters for norm values
void setCo2Norm(uint16_t norm)
{
	co2Norm = norm;
}
void setTempNorm(uint16_t norm)
{
	tempNorm = norm;
}
void setHumNorm(uint16_t norm)
{
	humNorm = norm;
}