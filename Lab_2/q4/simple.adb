with Ada.Text_IO; use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;
with Ada.Task_Identification; use Ada.Task_Identification;
with Ada.Dynamic_Priorities; use Ada.Dynamic_Priorities;
with System.Task_Info; use System.Task_Info;


procedure Simple is
   -- Import the C function stack_prefault defined in pre_fault.c ...
	procedure Stack_Prefault;
	pragma Import ( C , Stack_Prefault, "stack_prefault");
  -- Import the C function lock_memory defined in lock_memory.c ...
	procedure Lock_Memory;
	pragma Import (C, Lock_Memory , "lock_memory");	
   -- Import the C function job_with_cpu_time defined in clk_time.c ...
   	procedure  Job_With_CPU(Ex_T : Long_Integer );  
	pragma Import(C, Job_With_CPU , "job_with_cpu_time");	
   -- Set the priority of the main procedure Simple at maximum. Note that if this 
   -- setting is not done, then the priorities of T_1 and T_2 below will not be set 
   -- at the desired level ...
  pragma Priority(System.Priority'Last );
  -- inheritence for prority for T1 and T2
   -- Declare an anonymous task T_1 and set its priority ...
   task T_1 is
   pragma Priority(System.Priority'Last);
   end T_1;
   task T_2 is
   pragma Priority(System.Priority'Last);
   end T_2;
   -- Declare an anonymous task T_2 and set its priority ...
   
   -- T_1 is a periodic task of 150 iterations with an exact execution time EET 
   -- of jobs close to 20ms and an implicit relative deadline to be defined according 
   -- to the lab instructions ...
   task body T_1 is 
      Next : Ada.Real_Time.Time;
     -- declare variables
      Periode : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Milliseconds(60);--todo finish from here 
      Deadline : Ada.Real_Time.Time_Span := Milliseconds(60); 
      EET :Long_Integer:= 18*1000000; -- *150;
     
      -- Set the period ...
     
    --  Periode:= Ada.Real_Time.Milliseconds(60) ; -- to be modified according to instructions
      -- Set the deadline ...
     
     -- Deadline := Ada.Real_Time.Milliseconds(18) ; 
      -- Set the EET as a long integer to be passed to job_with_cpu_time ...
    --  EET := To_Time_Span(2);
      begin 
      Next := Ada.Real_Time.Clock;     
   --   for J in 1 .. 150 loop
for J in 1 .. 150 loop -- for testing only     
   begin-- launch a fresh new child @w@ so cute <3 yes this is to see if my comerads read the code :) hello andy and nico
            -- Launch the job ...
           Job_With_CPU(EET);
            -- Check if the deadline is respected ...
       	    if Clock - Next > Deadline 
	    then
		    Put_Line("Task 1 has missed deadline ");
--	    else
		 --   Put_Line("T1 all good "); --prety sure this will be introducing latency
	    end if;
	                
            Next := Next + Periode;
            delay until Next;           
        end;
      end loop; 
--	end;  
 end T_1;
   
   -- T_2 is a periodic task of 150 iterations with a job EET close to 40ms and 
   -- an implicit relative deadline to be defined  according to the lab instructions ...
   task body T_2 is  
      Next : Ada.Real_Time.Time;
      -- Set the period ... 
  	Periode : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Milliseconds(60);    
      -- Set the deadline ...
	Deadline : Ada.Real_Time.Time_Span := Milliseconds(60);
      
      -- Set the EET as a long integer to be passed to job_with_cpu_time ...
      EET : Long_Integer := 38*1000000;
   begin 
      Next := Ada.Real_Time.Clock;     
     for J in 1 .. 150 loop 
      -- begin   
            -- Launch the job
	    Job_With_CPU(EET);
          --  Put_Line("Hello T2");
            -- Check if the deadline is respected ...
            if Clock - Next > Deadline
	    then
		    Put_Line("Task 2 missed deadline ");
	    end if;
	    
            Next := Next + Periode;
            delay until Next;           
       --  end;
      end loop; 
   end T_2;
begin  
   -- Lock the current and future memory allocations ...
   Lock_Memory;
   -- Pre-fault the stack
   Stack_Prefault;
end Simple;

