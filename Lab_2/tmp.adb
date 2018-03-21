with Ada.Text_IO; use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;
with Ada.Task_Identification; use Ada.Task_Identification;
with Ada.Dynamic_Priorities; use Ada.Dynamic_Priorities;
with System.Task_Info; use System.Task_Info;


procedure Simple is
   -- Import the C function stack_prefault defined in pre_fault.c ...
 	
	function Stack_Prefault return Integer;
	pragma Import (C, Stack_Prefault, "stack_prefault");
   
   -- Import the C function lock_memory defined in lock_memory.c ...

	function Lock_Memory return Integer;
	pragma Import (C, Lock_Memory, "lock_memory");
   
   -- Import the C function job_with_cpu_time defined in clk_time.c ...

	function Job_With_Cpu_Time return Integer;
	pragma Import (C, Job_With_Cpu_Time, "job_with_cpu_time");
   

      	-- Set the priority of the main procedure Simple at maximum. Note that if this 
   -- setting is not done, then the priorities of T_1 and T_2 below will not be set 
   -- at the desired level ...

	pragma Priority(System.Any_Priority'Last);
  
   -- Declare an anonymous task T_1 and set its priority ...

	task T_1 is
	 pragma Priority(System.Any_Priority'Last);
	end T_1;
   
   -- Declare an anonymous task T_2 and set its priority ...

	task T_2 is
	  pragma Priority(System.Any_Priority'Last);
	end T_2;
   
   -- T_1 is a periodic task of 150 iterations with an exact execution time EET 
   -- of jobs close to 20ms and an implicit relative deadline to be defined according 
   -- to the lab instructions ...
   task body T_1 is 
      Next : Ada.Real_Time.Time;
      -- Set the period ...

	Period_T_1 : Time_Span := Milliseconds(60);
      
      -- Set the deadline ...

	Deadline_T_1 : Time_Span := Milliseconds(60);
      
      -- Set the EET as a long integer to be passed to job_with_cpu_time ...

	EET_T_1 : long integer;
       EET_T_1	:= Nanoseconds(19000000);
	
      
   begin 
      Next := Ada.Real_Time.Clock;     
      for J in 1 .. 150 loop
         begin
            -- Launch the job ...

		Job_With_CPU_Time(EET_T_1);
            
            -- Check if the deadline is respected ...

		IF Ada.Real_Time.Clock-Next > Deadline_T_1
			THEN Put("T_1 Misses its Deadline!\n");
		END IF;
                      
            Next := Next + Period_T_1;
            delay until Next;           
         end;
      end loop; 
   end T_1;
   
   -- T_2 is a periodic task of 150 iterations with a job EET close to 40ms and 
   -- an implicit relative deadline to be defined  according to the lab instructions ...
   task body T_2 is  
      Next : Ada.Real_Time.Time;
      -- Set the period ... 
      
	Period_T_2 : Time_Span := Milliseconds(60);

      -- Set the deadline ...

	Deadline_T_2 : Time_Span := Milliseconds(60);
      
      -- Set the EET as a long integer to be passed to job_with_cpu_time ...

	EET_T_2 : long integer;
       EET_T_2	:= Nanoseconds(39000000);	
      
   begin 
      Next := Ada.Real_Time.Clock;     
      for J in 1 .. 150 loop
         begin   
            -- Launch the job

		Job_With_CPU_Time(EET_T_2);
            
            -- Check if the deadline is respected ...

		IF Ada.Real_Time.Clock-Next > Deadline_T_2
			THEN Put("T_2 Misses its Deadline!\n");
		END IF;
                      
            Next := Next + Period_T_2;
            delay until Next;           
         end;
      end loop; 
   end T_2;
begin  
   -- Lock the current and future memory allocations ...

	Lock_Memory();	
   
   -- Pre-fault the stack

	Stack_Prefault();
   
end Simple;
