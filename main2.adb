with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Real_Time; 

with Ada.Calendar; 


procedure Main2 is
--decleration of tasks
   task type A;
   task type B;
   task body A is
	use Ada.Calendar;
	begin
		loop
		delay 0.1 ;
		Put_Line("A");
		Put_Line("B");

	end loop;
	end A;
   task body B is
	--declare usage 
	use Ada.Real_Time;
	--variables of task
	Wait_Time: Ada.Real_Time.Time;
	Interval :constant Ada.Real_Time.Time_Span := Ada.Real_Time.Milliseconds (100);
	begin
		loop
		Wait_Time := Clock+Interval;
		delay until Wait_Time ;
		Put_Line("C");
		Put_Line("D");

	end loop;
	end B;
--creation of 2 instances of tasknatm
	
type A_ptr is access A;
type B_ptr is access B;

AA : A_ptr;
BB : B_ptr;
--main task
begin
	AA := new A;
	BB := new B;
end Main2;
