
/* 
 * Low power demo for the stm32l011.  This
 * This example uses the RTC to wake the stm32l011 from a deep sleep about once every second
 * When the CPU goes to sleep it powers off the GPIO ports (states retained), turns off the ADC, 
 * reduces internal bus speed and puts the CPU into a deep sleep.  The RTC wakes the device up 
 * about a second later.  The ports and ADC are then powered up, the AHB bus set to run at full speed 
 * and some I/O is performed.
 * Current consumption when asleep is almost below the measurement range of my home equipment and is of the order of
 * 3 to 4 microamps.  The stm32l011 is part of a nucleo board and I suspect that there is some leakage from the
 * other circuitry on the nucleo board which is upsetting the sleep time current measurement.
 */


#include "stm32l011.h"
#include "serial.h" 
void delay(int);

void delay(int dly)
{
    while( dly--);
}

void initClockHSI16()
{
    // Use the HSI16 clock as the system clock - allows operation down to 1.5V
    RCC_CR &= ~BIT24;
    RCC_CR |= BIT0; // turn on HSI16 (16MHz clock)
    while ((RCC_CR & BIT2)==0); // wait for HSI to be ready
    // set HSI16 as system clock source 
    RCC_CFGR |= BIT0;
}
void configPins()
{
    // Enable PORTB where LED is connected
    RCC_IOPENR |= BIT1;
    GPIOB_MODER |= BIT6; // make bit3  an output
    GPIOB_MODER &= ~BIT7; // make bit3  an output
}	
void RTCISR(void)
{

    RTC_ISR &= ~BIT8;
    EXTI_PR |= BIT17;
  
        
}
void initRTC()
{	
    // Turn on power control circuit clock
    RCC_APB1ENR |= BIT28;
     // Unlock the RTC domain
    PWR_CR |= BIT8; // set DBP in PWR_CR
    // Turn on LSI
    RCC_CSR |= BIT0;
    // Wait for LSI to be ready
    while ( (RCC_CSR & BIT1) == 0);
   
    
    // Reset RTC 
    RCC_CSR |=  BIT19; // put RTC into reset
    RCC_CSR &=  ~BIT19; // take it back out of reset
    
    // Turn the RTC on, use LSI
    RCC_CSR |= BIT17;
    RCC_CSR &= ~BIT16;
    
    // Enable RTC
    RCC_CSR |= BIT18;
    // Unlock the RTC
    RTC_WPR = 0xca;
    RTC_WPR = 0x53;
    // RTC Initialization procedure (see reference manual)
    RTC_ISR |= BIT7; // set INIT bit
    while ((RTC_ISR & BIT6)==0); // wait for init to start
    
    ISER |= BIT2;   // enable RTC IRQ in NVIC
    
    // Alarm interrupt configuration	
    RTC_CR = 0;
    RTC_ALRMAR = BIT31+BIT23+BIT15+BIT7; // ignore all fields -> alarm every second (approx)
    RTC_ALRMASSR = 0x0f000000;  // match all sub second bits
    RTC_CR |= BIT12+BIT8;		// Enable alarm and alarm interrupt
    RTC_ISR &= ~BIT7; 			// clear INIT bit
    
    // RTC alarm is an EXTI interrupt in fact so need to configure this too
    EXTI_IMR |= BIT17;  // RTC is triggered via EXTI17,18 or 19
    EXTI_RTSR |= BIT17;
}
void initADC()
{

	// Turn on GPIOB
	RCC_IOPENR |= BIT1;
	// Turn on ADC 
	RCC_APB2ENR |= BIT9;	
	// Select analog mode for PA0
	GPIOA_MODER |= (BIT1+BIT0);  
	// Begin ADCCalibration	
	ADC_CR = BIT31;
	// Wait for calibration complete:  
	while ((ADC_CR & BIT31));
	// Select Channel 0
	ADC_CHSELR |= BIT0;
	// Enable the reference voltage
	ADC_CCR |= BIT22;	
	// Enable the ADC
	ADC_CR |= BIT0;  
}
void haltADC()
{
	
	// Select no channel 
	ADC_CHSELR = 0;
	// Disable the reference voltage
	ADC_CCR &= ~BIT22;	
	// Disable the ADC
	ADC_CR |= BIT1;  	
	// Turn off ADC 
	RCC_APB2ENR &= ~BIT9;	
}
void resumeADC()
{
	// Turn on GPIOA
	RCC_AHBENR |= BIT17;
	// Turn on ADC 
	RCC_APB2ENR |= BIT9;	
	// Select analog mode for PA0
	GPIOA_MODER |= (BIT1+BIT0);  
	// Select Channel 0
	ADC_CHSELR |= BIT0;
	// Enable the reference voltage
	ADC_CCR |= BIT22;	
	// Enable the ADC
	ADC_CR |= BIT0;  
}
int readADC()
{
        // Trigger a conversion
        ADC_CR |=  BIT2;
        // Wait for End of Conversion
        while ( (ADC_CR & BIT2) );
        // return result
        return ADC_DR;
}

void testADC()
{
        eputs("ADC: ");
        printHex(readADC());
        eputs("\r\n");
}

void low_power_mode()
{					
	// Turn off GPIO A and B	
	RCC_IOPENR &= ~(BIT1+BIT0);		
	// Turn off ADC 
	haltADC();		
	RCC_CFGR |= 0xf0; // drop AHB bus speed by a factor of 512
	PWR_CR |= BIT0; // switch voltage regulator to low power mode
	SCR |= BIT2; // enable deep sleep for the cortex M0+
	cpu_sleep(); // stop cpu (wfi)
}
void resume_from_low_power()
{	
        initClockHSI16();  // re-establish 16MHz clock
	RCC_CFGR &= ~0xf0; // speed AHB bus back up	
	// Turn on GPIO A and B
        RCC_IOPENR |= (BIT1 + BIT0);
	//Turn on ADC 
	resumeADC();	
}
int main()
{
    uint32_t Counter=0;
    initClockHSI16();
    configPins(); 
    initUART(9600);
    initRTC();
    initADC();    
    enable_interrupts();
    while(1)
    {
        
        resume_from_low_power(); // Interrupt woke up CPU - restore systems to full wakefulness
        // Awake now, do some control or other task.  
        GPIOB_ODR |= BIT3;  // Turn on LED
        testADC();          // read ADC channel 0 and output result to USART2
        drain(); // wait for any pending serial transmissions to end otherwise will exit sleep prematurely
        GPIOB_ODR &= ~BIT3; // Turn off LED
        low_power_mode();   // off to sleep to save power  
        
    } 
    return 0;
}








