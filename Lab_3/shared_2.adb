with Ada.Text_IO; use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;
with Ada.Task_Identification; use Ada.Task_Identification;
with Ada.Dynamic_Priorities; use Ada.Dynamic_Priorities;
with System.Task_Info; use System.Task_Info;
with Resources; use Resources;

procedure Shared_2 is
   procedure Stack_Prefault;
   pragma Import (C, Stack_Prefault, "stack_prefault");
   procedure Lock_Mem;
   pragma Import (C, Lock_Mem, "lock_memory");
   procedure Print(Val : Long_Integer);
   pragma Import(C, Print, "print_values");
   -- Import the C function "job_with_cpu_time" in clk_time.c
   
   pragma Priority(System.Priority'Last); 
   
   -- Declare a shared protected resource Shared_Data of type Resource ...
   Shared_Data :aliased Resource(0);
   
   -- Declare an anonymous task High_Priority_Task and set its priority 
   -- to a given high value P ...
   task High_Priority_Task is
   pragma  Priority(System.Priority'Last);
   end High_Priority_Task;
   
   -- Declare an anonymous task Low_Priority_Task and set its priority 
   -- to a lower priority P - 1 for example ...
   task Low_Priority_Task is
      pragma  Priority(System.Priority'Last -1  );

      end Low_Priority_Task;

   
   -- High_Priority_Task is a periodic task of 2 iterations with a exact execution time EET 
   -- of jobs equal to 200ms and an implicit relative deadline equal to 400ms ...
   task body High_Priority_Task is 
      Next : Ada.Real_Time.Time;
      -- Set the period ...
      Period : Time_Span  :=Milliseconds( 400);
      -- Set the deadline ...
      Deadline : Time_Span :=Milliseconds(400);
      -- The task jobs is split into equal parts of 100ms: the first part is a normal execution,
      -- the second is the duration of the critical section, these delays should be declared 
      -- as long integers ...
      --EE : Time_Span := Milliseconds(100);
      tmp : Long_Integer := 0 ;
      EE: Long_Integer:= 100*1000000 ;
   begin 
      Next := Ada.Real_Time.Clock;     
      for J in 1 .. 2 loop
         begin 
            Next := Clock;
		 -- Launch the normal execution ...
            tmp := Job_With_CPU_Time_Returned(EE);
            -- Launch the critical section ...
            Shared_Data.Lock_For(EE);
            -- Check if the deadline is respected ...
            if Clock < Next+Deadline then
            Put_Line("HP Deadline respected");
	    Print(Shared_Data.Read);
	    Print(tmp);
            else
            Put_Line("HP Deadline missed");
            end if;
            Next := Next + Period;
            delay until Next;           
         end;
      end loop; 
   end High_Priority_Task;
   
   
   -- Low_Priority_Task is a periodic task of 1 iteration with job EET equal to 500ms and 
   -- an implicit relative deadline equal to 800ms ...
   task body Low_Priority_Task is  
      Next : Ada.Real_Time.Time;
      -- Set the period ...
      
      Period : Time_Span := Milliseconds(800);
      -- Set the deadline ...
      Deadline : Long_Integer := 800;
      -- The job is a critical section of duration (long integer) equal to 500ms ...
      EE : Long_Integer := 500*1000000;
      
   begin 
      Next := Ada.Real_Time.Clock;
      for J in 1 .. 1 loop
         begin 
            -- Launch the critical section ...
            
		 Shared_Data.Lock_For(EE);
	         Print(Shared_Data.Read);
	   	 Next := Next + Period;
            delay until Next;          
         end;
      end loop;
   end Low_Priority_Task;
begin  
   -- Lock the current and future memory allocations ...
   Lock_Mem;
   -- Pre-fault the stack
   Stack_Prefault;
end Shared_2;
