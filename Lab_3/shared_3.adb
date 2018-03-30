with Ada.Text_IO; use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;
with Ada.Task_Identification; use Ada.Task_Identification;
with Ada.Dynamic_Priorities; use Ada.Dynamic_Priorities;
with System.Task_Info; use System.Task_Info;
with Resources; use Resources;

procedure Shared_3 is
   procedure Stack_Prefault;
   pragma Import (C, Stack_Prefault, "stack_prefault");
   procedure Lock_Mem;
   pragma Import (C, Lock_Mem, "lock_memory");  
   -- Import the C function "job_with_cpu_time" in clk_time.c

   pragma Priority(System.Priority'Last);
   
   -- Declare a shared protected resource Shared_Data of type Resource ...
   
   -- Declare an anonymous task High_Priority_Task and set its priority 
   -- to a given high value P ...
   
   -- Declare an anonymous task Medium_Priority_Task and set its priority 
   -- to a medium priority P - 1 for example ...
   
   -- Declare an anonymous task Low_Priority_Task and set its priority 
   -- to the lower priority P - 2 for example ...
   
   
   -- High_Priority_Task is a periodic task of 4 iterations with a job EET of normal execution 
   -- equal to 100ms and an implicit relative deadline equal to 200ms ...
   task body High_Priority_Task is 
      Next : Ada.Real_Time.Time;
      -- Set the period ...
      
      -- Set the deadline ...
      
      -- Set the EET ...

   begin 
      Next := Ada.Real_Time.Clock;     
      for J in 1 .. 4 loop
         begin 
            -- Launch the normal execution ...
              
            -- Check if the deadline is respected ...
          
            Next := Next + Period;
            delay until Next;           
         end;
      end loop; 
   end High_Priority_Task;
   
   
   -- Medium_Priority_Task is a periodic task of 2 iterations with a job EET equal to 100ms and 
   -- an implicit relative deadline equal to 400ms ...
   task body Medium_Priority_Task is 
      Next : Ada.Real_Time.Time;
      -- Set the period ...
      
      -- Set the deadline ...
      
      -- The task job is split into equal parts of 50ms: the first part is a normal execution,
      -- the second is the duration of the critical section, these delays should be declared 
      -- as long integers ...
      
   begin 
      Next := Ada.Real_Time.Clock;     
      for J in 1 .. 2 loop
         begin 
            -- Launch the normal execution ...
            
            -- Launch the critical section ...
            
            -- Check if the deadline is respected ...
          
            Next := Next + Period;
            delay until Next;           
         end;
      end loop; 
   end Medium_Priority_Task;
   
   -- Low_Priority_Task is a periodic task of 1 iteration with job EET equal to 300ms and 
   -- an implicit relative deadline equal to 800ms ...
   task body Low_Priority_Task is  
      Next : Ada.Real_Time.Time;
      -- Set the period ...
      
      -- Set the deadline ...
      
      -- The job is a critical section of duration (long integer) equal to 300ms ...
      
   begin  
      Next := Ada.Real_Time.Clock;
      for J in 1 .. 1 loop
         begin 
            -- Launch the critical section ...
            
            Next := Next + Period;
            delay until Next;          
         end;
      end loop;
   end Low_Priority_Task;
begin  
   -- Lock the current and future memory allocations ...
   
   -- Pre-fault the stack
   
end Shared_3;
