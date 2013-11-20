#include <dimmer.h>

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <avr/eeprom.h>
#include <avr/wdt.h>

#include <util/delay.h>

#define TRUE 			1
#define FALSE 			0

#define MAX_SIZE 		2048

#define DEBUG_DDR 		DDRC
#define DEBUG_PORT		PORTC
#define DEBUG_LED 		PC5

#define CMD_SET 		0x01

#define METHOD_SWITCH 	0x00
#define METHOD_RAMP 	0x01

#define DIMMER_PORT		PORTD
#define DIMMER_COUNT	2

uint8_t dimmerMasks[2] = {(1<<PC0),(1<<PC1)};
volatile uint8_t dimmerRequests[2] = {0,0};
volatile uint8_t dimmerLevels[2] = {0,0};


void initIO (void)
{
	//Set the debug LED as output
	DEBUG_DDR = (1<<DEBUG_LED);

	//INT0 - ZCD
	EICRA = (1<<ISC01) | (0<<ISC00);
	EIMSK |= (1<<INT0);

	//Dimming Timer
	TCCR0A = 	(1 << WGM01);
	TCCR0B = 	((1 << CS02) | (1 << CS00));		// CTC Mode - Prescaler 1024
	OCR0A = 	156;								// ~10ms
	TIMSK0 = 	(1 << OCIE0A);

	//Set up SPI
	DDRB &= ~((1<<2)|(1<<3)|(1<<5));   // SCK, MOSI and SS as inputs
    DDRB |= (1<<4);                    // MISO as output

    SPCR &= ~(1<<MSTR);                // Set as slave 
    SPCR |= (1<<SPR0)|(1<<SPR1);       // divide clock by 128
    SPCR |= (1<<SPE);                  // Enable SPI

	sei();
}

void initDimmers(void) {
	//Set up the Data Direction Register
	DDRD = (1<<PD0) | (1<<PD1);
	//Set the triacs off.
	PORTD = 0x00;
}

unsigned char *spi_read(uint8_t bytes, unsigned char c[]) 
{
	for(uint8_t i = 0; i < bytes; i++) {
		while(!(SPSR & (1<<SPIF)));
		c[i] = SPDR;
	}

	return c;
} 

int main (void)
{
	initIO(); //Setup IO pins and defaults
	initDimmers(); //Set up the dimmers.

	while(1) {

		while(!(SPSR & (1<<SPIF)));

        if(SPDR == CMD_SET) {
        	//Read the next 3 bytes
        	unsigned char c[3];
        	spi_read(3, c);

        	if(c[0] == METHOD_SWITCH) {
        		switchToLevel((uint8_t)c[1], (uint8_t)c[2]);
        	} else {
				rampToLevel((uint8_t)c[1], (uint8_t)c[2]);
        	}

        }

	}

	return(0);
}

ISR(SPI_STC_vect)
{
	DEBUG_PORT = (1 << DEBUG_LED);
}

void rampToLevel(uint8_t index, uint8_t level) {
	if(level > 255)
		level = 255;
	
	if(level < 0 ) 
		level = 0;
	
	dimmerRequests[index] = level;
}

void switchToLevel(uint8_t index, uint8_t level) {
	if(level > 255)
		level = 255;
	
	if(level < 0 ) 
		level = 0;

	dimmerLevels[index] = level;
	dimmerRequests[index] = level;
}

void debugLed(uint8_t state) {
	DEBUG_PORT = (state<<DEBUG_LED);
}

volatile uint16_t count;
//Zero Cross Detection.
ISR(INT0_vect) {
	count = 256;

	TCCR1B |= 	((1 << CS10) | (1 << WGM12));
	OCR1A = 	400;
	TIMSK1 |= 	(1 << OCIE1A);	
}

//Zero Cross Timer Interrupt.
ISR(TIMER1_COMPA_vect) {
	count--;

	for(uint8_t i = 0; i < DIMMER_COUNT; i++) {
		if(dimmerLevels[i] >= count) {
			DIMMER_PORT |= dimmerMasks[i];
			_delay_us(10);
	 		DIMMER_PORT ^= dimmerMasks[i];
		}
	}

}

//Dimming Interrupt
ISR(TIMER0_COMPA_vect) {

	for(uint8_t i = 0; i < DIMMER_COUNT; i++) {
		if(dimmerRequests[i] > dimmerLevels[i]) {
			dimmerLevels[i]++;
		} else if(dimmerRequests[i] < dimmerLevels[i]) {
			dimmerLevels[i]--;
		}
	}

}