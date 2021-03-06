//A class for packaging measured data.
#include "SensorDataPackageHandler.h"

uint16_t temperature;
uint16_t humidity;
uint16_t co2Ppm;

//A setter for humidity.
void setHumidity(uint16_t value){
	humidity = value;
}

//A setter for temperature.
void setTemperature(uint16_t value){
	temperature = value;
}

//A setter for CO2.
void setCo2Ppm(uint16_t value){
	co2Ppm = value;
}

//A function that takes the measured data and puts it into payload bits, then returns it.
lora_driver_payload_t sensorDataPackageHandler_getLoRaPayload(uint8_t port_No)
{
	lora_driver_payload_t* payload_t;
	
	payload_t = pvPortMalloc(sizeof(lora_driver_payload_t));
	
	if(payload_t != NULL){
		payload_t->portNo=port_No;
		payload_t->len=6;
		payload_t->bytes[0]=co2Ppm >> 8;
		payload_t->bytes[1]=co2Ppm & 0xFF;
		payload_t->bytes[2]=humidity >> 8;
		payload_t->bytes[3]=humidity & 0xFF;
		payload_t->bytes[4]=temperature >> 8;
		payload_t->bytes[5]=temperature & 0xFF;
	}
	
	return *payload_t;
}

