/* Name: main.c
 * Project: PowerSwitch based on AVR USB driver
 * Author: Christian Starkjohann
 * Creation Date: 2005-01-16
 * Tabsize: 4
 * Copyright: (c) 2005 by OBJECTIVE DEVELOPMENT Software GmbH
 * License: GNU GPL v2 (see License.txt) or proprietary (CommercialLicense.txt)
 * This Revision: $Id$
 */

 #define F_CPU 12000000UL  // 1 MHz

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <avr/eeprom.h>
#include <avr/wdt.h>

#include "usbdrv.h"
#include "oddebug.h"
#include <util/delay.h>

#define DEBUG_DDR       DDRC
#define DEBUG_PORT      PORTC
#define DEBUG_LED       PC0

#define USB_CMD_SPI     1
#define USB_CMD_SET     2

#define CMD_STATUS      0x00 //Obtain the status of the dimmer channels
#define CMD_SET         0x01 //Set a dimmer channel

#define METHOD_SWITCH   0x00
#define METHOD_RAMP     0x01

#define EEPROM_LOCATION (void *)37

volatile int data = 0;

unsigned char spi_putbyte(uchar spi_data) 
{ 
    SPDR = spi_data; 
    while (!(SPSR & (1<<SPIF)));  
    return SPDR; 
} 

uint8_t volatile currentMethod = 0x00;
USB_PUBLIC uchar usbFunctionSetup(uchar data[8])
{

    usbRequest_t    *rq = (void *)data;
//    uchar           status = eeprom_read_byte(EEPROM_LOCATION);
//    static uchar    replyBuf[2];

//    usbMsgPtr = replyBuf;

    currentMethod = rq->bRequest;
    if(rq->bRequest == USB_CMD_SPI) {
        return USB_NO_MSG;
    } else 
    if(rq->bRequest == USB_CMD_SET) {
        return USB_NO_MSG;
    }
    return 0;
}

USB_PUBLIC uchar usbFunctionWrite(uchar *data, uchar len) {
    uchar i;

    if(currentMethod == USB_CMD_SPI) {
        //Select the slave
        PORTB &= ~(1<<PB2);
        for(i = 0; i < len; i++) {
            spi_putbyte(data[i]);
        }
        //Deselect the slave.
        PORTB |= (1<<PB2);
    } else
    if(currentMethod == USB_CMD_SET) {

        if(len == 3) {
            //Select the slave
            PORTB &= ~(1<<PB2);

            spi_putbyte(CMD_SET);
            spi_putbyte(data[0]);
            spi_putbyte(data[1]);
            spi_putbyte(data[2]);

            //Deselect the slave.
            PORTB |= (1<<PB2);
        }
    }
                
    return 1;
}

void initIO (void)
{
    DDRB = ~USBMASK;
    PORTD = 0; /* No pullups on USB pins */

    //Set PORT C debug LED output.
    DEBUG_DDR = (1<<DEBUG_LED);

    //Set up SPI
    DDRB |= (1<<PB2)|(1<<PB3)|(1<<PB5);     // SCK, MOSI and SS as outputs
    DDRB &= ~(1<<PB4);                      // MISO as input

    //Deselect the slave
    PORTB |= (1<<PB2);

    SPCR |= (1<<MSTR);                      // Set as Master
    SPCR |= (1<<SPR0)|(1<<SPR1);            // divided clock by 128
    SPCR |= (1<<SPE);                       // Enable SPI
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

