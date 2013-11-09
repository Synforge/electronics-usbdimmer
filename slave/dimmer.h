#include <avr/io.h>

void initIO(void);
void rampToLevel(uint8_t index, uint8_t level);
void switchToLevel(uint8_t index, uint8_t level);
void initDimmers(void);
void debugLed(uint8_t state);