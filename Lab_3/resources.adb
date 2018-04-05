with Interfaces.C; use Interfaces.C;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;
package body Resources is



   protected body Resource is

      function Read return Long_Integer is

      begin
         -- Return the resource data ...
         return The_Data;
         
      end Read;
      procedure Write(New_Value : Long_Integer) is
      begin
         -- Write the new value of the resource data ...
         The_Data := New_Value;
         
      end Write;
      procedure Lock_For(Lock_Time : Long_Integer) is 
      begin
         -- Lock the resource for a duration Lock_Time (indication: 
         -- use the functions Write and Job_With_CPU_Time_Returned) ...
         Write(Job_With_CPU_Time_Returned(Lock_Time));
         
      end Lock_For;
   end Resource;
end Resources;
