with bcm2835_h;
with Interfaces.C; use Interfaces.C;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Streams.Stream_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Ada.Real_Time;

procedure Sensor is
   Trig : Interfaces.C.unsigned_char := Interfaces.C.unsigned_char(bcm2835_h.RPI_GPIO_P1_16);
   Echo : Interfaces.C.unsigned_char := Interfaces.C.unsigned_char(bcm2835_h.RPI_GPIO_P1_18);
   Inpu: Interfaces.C.unsigned_char := Interfaces.C.unsigned_char(bcm2835_h.BCM2835_GPIO_FSEL_INPT);
   Outp: Interfaces.C.unsigned_char := Interfaces.C.unsigned_char(bcm2835_h.BCM2835_GPIO_FSEL_OUTP); 
   Pulse_Start : Ada.Real_Time.Time;
   Pulse_End : Ada.Real_Time.Time;
   use type Ada.Real_Time.Time;
   Pulse_Duration : Ada.Real_Time.Time_Span;
   Distance : Duration;
begin
   if integer(bcm2835_h.bcm2835_init) = 0 then 
      Put_Line("Error while initializing BCM2835 library");
   end if;
   
   
   bcm2835_h.Bcm2835_gpio_fsel(Trig,Outp);
   bcm2835_h.Bcm2835_gpio_fsel(Echo,Inpu);
   
   bcm2835_h.bcm2835_gpio_write(Trig, 0);
   Put_line("Waitng For Sensor To Settle");
   delay 2.0;
   
   bcm2835_h.bcm2835_gpio_write(Trig, 1);
   delay 0.00001;
   bcm2835_h.bcm2835_gpio_write(Trig, 0);
   
   while bcm2835_h.Bcm2835_Gpio_Lev(Echo) = 0 loop
      Pulse_Start := Ada.Real_Time.Clock ;
   end loop;
   
   while bcm2835_h.Bcm2835_Gpio_Lev(Echo) = 1 loop
      Pulse_End := Ada.Real_Time.Clock; 
   end loop; 
   
   Pulse_Duration := Pulse_End - Pulse_Start;
   
   Distance := Ada.Real_Time.To_Duration (Pulse_Duration) * Duration(17150);
  
   Put_Line ("Distance is " & Duration'Image(Distance));
   
   bcm2835_h.Bcm2835_gpio_clr(Trig);
   bcm2835_h.Bcm2835_gpio_clr(Echo);
   
   
   if integer(bcm2835_h.bcm2835_close) = 0 then
      Put_Line("Error while closing BCM2835 library");
   end if;
   
end Sensor;
