with Ada.Text_IO; use Ada.Text_IO;

package body Prime_Ada is
   
   procedure Get_Prime (n : Integer) is
      prime : array (1 .. n) of Integer;
      is_prime : array (1 .. n) of Boolean := (False, others => True);
   begin
      cnt := 0;
      for i in 2 .. n loop
         if is_prime (i) then
            cnt := cnt + 1;
            prime (cnt) := i;
         end if;
         for j in 1 .. cnt loop
            if i * prime (j) > n then
               exit;
            end if;
            is_prime (i * prime (j)) := False;
            if i mod prime (j) = 0 then
               exit;
            end if;
         end loop;
      end loop;
      
   end Get_Prime;

end Prime_Ada;
