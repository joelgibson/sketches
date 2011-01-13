/*
  SIRC (Sony Infa-Red Communication)
  http://www.sbprojects.com/knowledge/ir/sirc.htm
  
  Essentially each signal has a start pulse, then 7 command
  bytes, and 5 address bytes.
  
  sony_send_ir() is the only function here that should be
  called elsewhere.
*/

void sony_ir_start()
{
  //3T = 1800 microseconds of on
  
  pin_38khz(IR_PIN, 2400);
  pin_off(IR_PIN, 600);
}

void sony_ir_0()
{
  //600us off, 600us on
  
  pin_38khz(IR_PIN, 600);
  pin_off(IR_PIN, 600);
}

void sony_ir_1()
{
  //600us off, 1200us on
  
  pin_38khz(IR_PIN, 1200);
  pin_off(IR_PIN, 600);
}

void sony_send_ir(byte command, byte address)
{
  //The command is a 7 bit wide number, and address is 5 bits wide
  //LSB for both is sent first.
  byte mask;
  int i;
  
  //Send the start signal
  sony_ir_start();
  
  //Send the command byte
  for (i=0; i < 7; i++)
    if (bitRead(command, i))
      sony_ir_1();
    else
      sony_ir_0();
  
  //Send the address byte
  for (i=0; i < 5; i++)
    if (bitRead(address, i))
      sony_ir_1();
    else
      sony_ir_0();

}
