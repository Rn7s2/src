with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Aux; use Ada.Numerics.Aux;
with Prime_Ada; use Prime_Ada;

procedure Main is
begin
   declare
      n : Integer;
   begin
      for i in 1 .. 6 loop
         n := Integer (Pow (Double (10), Double (i)));
         Put ("n = ");
         Put_Line (Integer'Image (n));
         Get_Prime (n);
         Put (Integer'Image (cnt));
         Put_Line (" prime numbers found.");
      end loop;
   end;
end Main;
