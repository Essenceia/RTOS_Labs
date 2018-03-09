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
   	procedure  Job_With_CPU(Ex_T : Integer );  
	pragma Import(C, Job_With_CPU , "job_with_cpu_time");	
   -- Set the priority of the main procedure Simple at maximum. Note that if this 
   -- setting is not done, then the priorities of T_1 and T_2 below will not be set 
   -- at the desired level ...
  pragma Prority(System.Priority'First );
  -- inheritence for prority for T1 and T2
   -- Declare an anonymous task T_1 and set its priority ...
   task T_1;
   task T_2;
   pragma Set_Priority(System.Priority'First, T1);
   pragma Set_Priority(System.Priority'First, T2);
   -- Declare an anonymous task T_2 and set its priority ...
   
   -- T_1 is a periodic task of 150 iterations with an exact execution time EET 
   -- of jobs close to 20ms and an implicit relative deadline to be defined according 
   -- to the lab instructions ...
   task body T_1 is 
      Next : Ada.Real_Time.Time;
     -- declare variables
      Periode : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Milliseconds();--todo finish from here 
      Deadline : Integer; 
      EET : Long Integer;
     
      -- Set the period ...
     
      Period:= 60 ; -- to be modified according to instructions
      -- Set the deadline ...
      Deadline := 18 ; 
      -- Set the EET as a long integer to be passed to job_with_cpu_time ...
      EET := 18*150;
      begin 
      Next := Ada.Real_Time.Clock;     
      for J in 1 .. 150 loop
       begin
            -- Launch the job ...
      --      Job_With_CPU(
            -- Check if the deadline is respected ...
        Put_Line("hello T1");              
            Next := Next + Period;
            delay until Next;           
         end;
      end loop; 
   end T_1;
   
   -- T_2 is a periodic task of 150 iterations with a job EET close to 40ms and 
   -- an implicit relative deadline to be defined  according to the lab instructions ...
   task body T_2 is  
      Next : Ada.Real_Time.Time;
      -- Set the period ... 
      
      -- Set the deadline ...
      
      -- Set the EET as a long integer to be passed to job_with_cpu_time ...
      
   begin 
      Next := Ada.Real_Time.Clock;     
      for J in 1 .. 150 loop
        begin   
            -- Launch the job
            Put_Line("Hello T2");
            -- Check if the deadline is respected ...
            
            Next := Next + Period;
            delay until Next;           
         end;
      end loop; 
   end T_2;
begin  
   -- Lock the current and future memory allocations ...
   Lock_Memory;
   -- Pre-fault the stack
   Stack_Prefault;
end Simple;
