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

   pragma Priority(System.Priority'Last);
   
   -- Declare a shared protected resource Shared_Data of type Resource ...
      Shared_Data :aliased Resource(0);

   -- Declare an anonymous task High_Priority_Task and set its priority 
   -- to a given high value P ...
   task High_Priority_Task is
      pragma  Priority(System.Priority'Last);
      end High_Priority_Task;

   -- Declare an anonymous task Medium_Priority_Task and set its priority 
   -- to a medium priority P - 1 for example ...
   task Medium_Priority_Task is
      pragma  Priority(System.Priority'Last-1);
   end Medium_Priority_Task;

   -- Declare an anonymous task Low_Priority_Task and set its priority 
   -- to the lower priority P - 2 for example ...
   task Low_Priority_Task is
         pragma  Priority(System.Priority'Last -2  );
   end Low_Priority_Task;

   
   -- High_Priority_Task is a periodic task of 4 iterations with a job EET of normal execution 
   -- equal to 100ms and an implicit relative deadline equal to 200ms ...
   task body High_Priority_Task is 
      Next : Ada.Real_Time.Time;
      -- Set the period ...
      Period : Time_Span  :=Milliseconds(200);

      -- Set the deadline ...
      Deadline : Time_Span :=Milliseconds(200);
      -- Set the EET ...
      EE: Long_Integer:= 100*1000000 ;
      tmp : Long_Integer := 0 ;
   begin 
      for J in 1 .. 4 loop
         begin
             Next := Clock;
            -- Launch the normal execution ...
            tmp := Job_With_CPU_Time_Returned(EE);
            -- Check if the deadline is respected ...
            if Clock < Next+Deadline then
                      Put_Line("HP Deadline respected");
                      else
                      Put_Line("HP Deadline missed ... not normal");
          	end if;
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
       Period : Time_Span  :=Milliseconds(400);
      -- Set the deadline ...
      Deadline : Time_Span :=Milliseconds(400);
      -- The task job is split into equal parts of 50ms: the first part is a normal execution,
      -- the second is the duration of the critical section, these delays should be declared 
      -- as long integers ...
      EE: Long_Integer:= 50*1000000 ;
      tmp : Long_Integer := 0 ;
   begin 

      for J in 1 .. 2 loop
         begin 
            Next := Clock;
            -- Launch the normal execution ...
            tmp := Job_With_CPU_Time_Returned(EE);
            -- Launch the critical section ...
            Shared_Data.Lock_For(EE);
            -- Check if the deadline is respected ...
            if Clock < Next+Deadline then
                      Put_Line("MP Deadline respected");
            else
                      Put_Line("MP Deadline missed");
            end if;
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
      Period : Time_Span  :=Milliseconds(800);
      -- Set the deadline ...
      Deadline : Time_Span :=Milliseconds(800);
      -- The job is a critical section of duration (long integer) equal to 300ms ...
      EE: Long_Integer:= 300*1000000 ;
   begin  
      for J in 1 .. 1 loop
         begin
            Next := Clock;
            -- Launch the critical section ...
            Shared_Data.Lock_For(EE);
            if Clock < Next+Deadline then
                        Put_Line("LP Deadline respected");
            else
                        Put_Line("LP Deadline missed");
            end if;
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
end Shared_3;
