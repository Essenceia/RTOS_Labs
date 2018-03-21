with Ada.Text_IO; use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;
with Ada.Task_Identification; use Ada.Task_Identification;
with Ada.Dynamic_Priorities; use Ada.Dynamic_Priorities;
with System.Task_Info; use System.Task_Info;
--support hw interfacing
with bcm2835_h;
with Interfaces.C; use Interfaces.C;
with stdint_h;

procedure Led is
   -- Import the C function stack_prefault defined in pre_fault.c ...
	procedure Stack_Prefault;
	pragma Import ( C , Stack_Prefault, "stack_prefault");
  -- Import the C function lock_memory defined in lock_memory.c ...
	procedure Lock_Memory;
	pragma Import (C, Lock_Memory , "lock_memory");	
	procedure Job_With_Cpu_Time(ARG : Long_Integer);
	pragma Import(C, Job_With_Cpu_Time, "job_with_cpu_time");
      	pragma Priority(System.Priority'Last);
  -- inheritence for prority for T1 and T2
   -- Declare an anonymous task T_1 and set its priority ...
   task Blink is
   pragma Priority(System.Priority'Last);
   end Blink;
  task body Blink is 
       tmp_close : Interfaces.C.int;
	  Next : Ada.Real_Time.Time;
     -- declare variables
      Periode : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Milliseconds(40);--todo finish from here 
      Deadline : Ada.Real_Time.Time_Span := Milliseconds(40); 
      EET :Long_Integer:= 39*1000000; 
      Led_status : stdint_h.uint8_t:= 0; --based on documentation in wrapper bcm2835_h.abs
 	Led_pin : constant stdint_h.uint8_t:= bcm2835_h.RPI_BPLUS_GPIO_J8_12;--pin to write physical number 12 called bcm 18 
  begin 
      Next := Ada.Real_Time.Clock;     
   --	init anf check init : check libs
   if integer(bcm2835_h.bcm2835_init) = 0 then
	   put_line("error in init of bcm lib ");
	   else
		   --set pin mode to output
		   bcm2835_h.bcm2835_gpio_fsel(Led_pin,bcm2835_h.BCM2835_GPIO_FSEL_OUTP);

      for J in 1 .. 150 loop -- for testing only     
             begin-- launch a fresh new child @w@ so cute <3 yes this is to see if my comerads read the code :) hello andy and nico
            -- Launch the job ...
             Job_With_Cpu_Time(EET);
            -- Check if the deadline is respected ...
       	      if Clock - Next > Deadline 
	      then
		    Put_Line("Task 1 has missed deadline ");
	      else
		    --all good going to blink led
		    Led_status := not Led_status;
			bcm2835_h.bcm2835_gpio_write(Led_pin,Led_status);
		 --   Put_Line("T1 all good "); --prety sure this will be introducing latency
	      end if;
	                
              Next := Next + Periode;
              delay until Next;           
	     end;        
      end loop;
	  Led_status := 0;
	  --set pin to low
	  bcm2835_h.bcm2835_gpio_write(Led_pin, Led_status);
	  --close interfaces 
	  tmp_close := bcm2835_h.bcm2835_close;
      end if;  
 end Blink;
begin  
   -- Lock the current and future memory allocations ...
   Lock_Memory;
   -- Pre-fault the stack
   Stack_Prefault;

end Led;

