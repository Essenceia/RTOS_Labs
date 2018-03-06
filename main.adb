with Ada.Text_IO;
use Ada.Text_IO;
procedure Main is
--decleration of tasks
   task A;
   task B;
   task body A is
	begin
		loop
		Put_Line("A");
		Put_Line("B");
	delay 1.0;
	end loop;
	end A;
   task body B is
	begin
		loop
		Put_Line("C");
		Put_Line("D");
	delay 1.0;
	end loop;
	end B;
--creation of 2 instances of task
--main task
begin
null;
end Main;
