#ifdef TIMER2_38KHZ

//Use the timer2 registers - uses pin 3 regardless of any input

void init_timer2_38khz()
{
  //Uses the timer2 registers to generate 38kHz on pin 3
  
  //WGM = 111: Fast PWM with OCRA controlling TOP
  //CS  = 010: 8 divider on clock select
  TCCR2A = _BV(WGM21) | _BV(WGM20);  
  TCCR2B = _BV(WGM22) | _BV(CS21);
  
  //Freq = 16MHz / 8 / (OCR2A + 1)
  OCR2A = 51;
  
  //Duty cycle = OCR2B / OCR2A
  OCR2B = 51/2;
  
  //Now ~38kHz can be toggled on pin 3 by using TCCR2A ^= _BV(COM2B1);
}

void timer2_pin3_on()
{
  TCCR2A |= _BV(COM2B1);
}

void timer2_pin3_off()
{
  TCCR2A &= ~(_BV(COM2B1));
}
void pin_38khz(int pin, int time)
{
  timer2_pin3_on();
  delayMicroseconds(time);
  timer2_pin3_off();
}

void pin_off(int pin, int time) {
  timer2_pin3_off();
  delayMicroseconds(time);
}

#else

//Use digitalWrite()

void pin_38khz(int pin, int time)
{
  //39kHz = 25us period.
  //Should be approx 12us or 13us half-duty-cycle
  //DigitalWrite takes about 3.6us to complete.
  //Therefore wait time is 9us
  
  const int period = 25;
  const int wait_time = 9;
  int osc;  //Oscillations
  
  for (osc = time/period; osc > 0; osc--)
  {
    digitalWrite(pin, HIGH);
    delayMicroseconds(wait_time);
    digitalWrite(pin, LOW);
    delayMicroseconds(wait_time);
  }
}

void pin_off(int pin, int time) {
  digitalWrite(pin, LOW);
  delayMicroseconds(time);
}

#endif
