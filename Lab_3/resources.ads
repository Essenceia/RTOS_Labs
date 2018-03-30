package Resources is   
   -- Import the C function "job_with_cpu_time_returned" in clk_time.c
   function Job_With_CPU_Time_Returned(etime :Long_Integer ) return long_Integer;
   pragma Import ( C , Job_With_CPU_Time_Returned, "job_with_cpu_time");
   EE : Long_Integer := 100;
   protected type Resource(Initial_Value : Long_Integer) is
      function Read return Long_Integer;
      procedure Write(New_Value : Long_Integer);
      procedure Lock_For(Lock_Time : Long_Integer);
   private
      The_Data : aliased Long_Integer := Initial_Value;  
   end Resource;
end Resources; 
