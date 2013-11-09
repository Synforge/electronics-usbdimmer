#include <dimmer.h>

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <avr/eeprom.h>
#include <avr/wdt.h>

#include <util/delay.h>

#define DIMMER_COUNT 2
#define TRUE 1
#define FALSE 0

#define MAX_SIZE 2048

#define DEBUG_DDR DDRC
#define DEBUG_PORT PORTC
#define DEBUG_LED PC5

static const char CMD_SET = 0x01; // Set command e.g. [0x01 (command), 0x00(method), 0x01(index) 0xDF(level)]

static const char METHOD_SWITCH = 0x00;
static const char METHOD_RAMP = 0x01;

struct dimmer {
	volatile uint8_t level_cur;
	volatile uint8_t level_req;
	volatile uint8_t *port;
	uint8_t mask;	
} dimmers[DIMMER_COUNT];

void initIO (void)
{
	//Set the debug LED as output
	DEBUG_DDR = (1<<DEBUG_LED);

	//INT0 - ZCD
	EICRA = (1<<ISC01) | (0<<ISC00);
	EIMSK |= (1<<INT0);

	//Dimming Timer (TODO: Enable/Disable on Dimming request).
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

	dimmers[0].level_cur = 0;
	dimmers[0].level_req = 0;
	dimmers[0].port = &PORTD;
	dimmers[0].mask = (1<<PD0);
	
	dimmers[1].level_cur = 0;
	dimmers[1].level_req = 0;
	dimmers[1].port = &PORTD;
	dimmers[1].mask = (1<<PD1);
}

int main (void)
{
	initIO(); //Setup IO pins and defaults
	initDimmers(); //Set up the dimmers.

	char commandBuffer[4];
	uint8_t count = 0;

	while(1) {

		while(!(SPSR & (1<<SPIF)));

        commandBuffer[count++] = SPDR;

        if(commandBuffer[0] == CMD_SET && count == 4) {
        	//We have all our data        	
        	if(commandBuffer[1] == METHOD_SWITCH) {
        		switchToLevel((uint8_t)commandBuffer[2], (uint8_t)commandBuffer[3]);
        	} else {
				rampToLevel((uint8_t)commandBuffer[2], (uint8_t)commandBuffer[3]);
        	}

        	//Toggle the Debug LED
        	DEBUG_PORT ^= (1 << DEBUG_LED);

        	count = 0;
        }

	}

	return(0);
}

void rampToLevel(uint8_t index, uint8_t level) {
	if(level > 255)
		level = 255;
	
	if(level < 0 ) 
		level = 0;
	
	dimmers[index].level_req = level;
}

void switchToLevel(uint8_t index, uint8_t level) {
	if(level > 255)
		level = 255;
	
	if(level < 0 ) 
		level = 0;

	dimmers[index].level_req = level;
	dimmers[index].level_cur = level;
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
		if(dimmers[i].level_cur > 0 && dimmers[i].level_cur >= count) {
			*dimmers[i].port |= dimmers[i].mask;
			_delay_us(10);
			*dimmers[i].port ^= dimmers[i].mask;
		}
	}
}

//Dimming Interrupt
ISR(TIMER0_COMPA_vect) {
	for(uint8_t i = 0; i < DIMMER_COUNT; i++) {
		if(dimmers[i].level_req > dimmers[i].level_cur) {
			dimmers[i].level_cur++;
		} else if(dimmers[i].level_req < dimmers[i].level_cur) {
			dimmers[i].level_cur--;
		}
	
	}
}