/* Name: main.c
 * Project: PowerSwitch based on AVR USB driver
 * Author: Christian Starkjohann
 * Creation Date: 2005-01-16
 * Tabsize: 4
 * Copyright: (c) 2005 by OBJECTIVE DEVELOPMENT Software GmbH
 * License: GNU GPL v2 (see License.txt) or proprietary (CommercialLicense.txt)
 * This Revision: $Id$
 */

#define F_CPU 12000000UL 

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <avr/eeprom.h>
#include <avr/wdt.h>

#include "usbdrv.h"
#include "oddebug.h"
#include <util/delay.h>

/*
This module implements an 8 bit parallel output controlled via USB. It is
intended to switch the power supply to computers and/or other electronic
devices.

Application examples:
- Rebooting computers located at the provider's site
- Remotely switch on/off of rarely used computers
- Rebooting other electronic equipment which is left unattended
- Control room heating from remote
*/

#define EEPROM_LOCATION (void *)37

volatile int data = 0;

char spi_putbyte(char spi_data) 
{ 
    SPDR = spi_data; 
    while (!(SPSR & (1<<SPIF)));  
    return SPDR; 
} 

USB_PUBLIC uchar usbFunctionSetup(uchar data[8])
{
usbRequest_t    *rq = (void *)data;
uchar           status = eeprom_read_byte(EEPROM_LOCATION);
static uchar    replyBuf[2];

    usbMsgPtr = replyBuf;
    if(rq->bRequest == 4) {
        int level = rq->wIndex.bytes[0];
        spi_putbyte(level);
    }
    return 0;
}

void initIO (void)
{
    DDRB = ~USBMASK;
    PORTD = 0; /* No pullups on USB pins */

    //Set PORT C as all outputs.
    DDRC = 0xFF;

    PORTC = 0xFF;

    //Set up SPI
    DDRB |= (1<<2)|(1<<3)|(1<<5);    // SCK, MOSI and SS as outputs
    DDRB &= ~(1<<4);                 // MISO as input

    SPCR |= (1<<MSTR);               // Set as Master
    SPCR |= (1<<SPR0)|(1<<SPR1);     // divided clock by 128
    SPCR |= (1<<SPE);                // Enable SPI
}

int main(void)
{
    uchar   i;

    wdt_enable(WDTO_1S);
    odDebugInit();

    initIO();

/* We fake an USB disconnect by pulling D+ and D- to 0 during reset. This is
 * necessary if we had a watchdog reset or brownout reset to notify the host
 * that it should re-enumerate the device. Otherwise the host's and device's
 * concept of the device-ID would be out of sync.
 */
    usbDeviceDisconnect();  /* enforce re-enumeration, do this while interrupts are disabled! */
    i = 0;
    while(--i){         /* fake USB disconnect for > 500 ms */
        wdt_reset();
        _delay_ms(2);
    }
    usbDeviceConnect();

    usbInit();

    sei();

    for(;;){    /* main event loop */
        wdt_reset();
        usbPoll();
    }
    return 0;
}

