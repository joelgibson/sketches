#define IR_PIN          (13)

#define ADDRESS_TV      (1)

#define COMMAND_POWER   (21)

/*
  Uncomment the following line to use 38kHz generated
  via the timer2 registers on the arduino. The LED must be plugged
  into pin 3 in order for this to work.
*/

//#define TIMER2_38KHZ

void setup()
{
  #ifdef TIMER2_38KHZ
    pinMode(3, OUTPUT);
    init_timer2_38khz();
    
  #else
    pinMode(IR_PIN, OUTPUT);
    
  #endif
}

void loop()
{
  //Send power off signal
  int i;
  for(i=0; i<3; i++)
  {
    sony_send_ir(COMMAND_POWER, ADDRESS_TV);
    delay(45);
  }
  
  delay(1000);
}


