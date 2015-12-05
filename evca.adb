--------------------------------------------------------------------------------
--
-- Eric Laursen, 15 October 2015, CS 441-001 Doodling
--
-- evca.adb -- main execution loop
--
-- Implementation of Melanie Mitchell's Evolving Cellular Automata with
--    Genetic Algorithms
--------------------------------------------------------------------------------


with Ada.Text_IO;
with Ada.Integer_Text_IO;

with Ada.Numerics.Discrete_Random;
with BitMan;

procedure Evca is
   
   package Rand_Int is new Ada.Numerics.Discrete_Random (BitMan.Bit_Number);
   
   Seed : Rand_Int.Generator;
   Field, Field_Old : BitMan.Bit_Field;
   Iterations : Natural := 0;
   
begin
   
   Rand_Int.Reset (Seed);
   
   -- Populate Field with a random nr. of random position True bits
   
   for I in 0 .. Rand_Int.Random (Seed) loop
      Field (Rand_Int.Random (Seed)) := True;
   end loop;
   
   BitMan.Print_Bit_Field (Field);
   
   -- Apply the rule that a bit is False if there are less than 2 True bits in
   --   its neighborhood (including itself) and True otherwise (2 or more).
   -- Continue until there are no changes in a loop iteration.
   
   while Bitman."/=" (Field, Field_Old) loop
      
      Field_Old := Field;
      
      for I in 0 .. BitMan.Bit_Number'Last loop
	 if BitMan.Neighborhood_Population (Field_Old, I) < 2 then
	    Field (I) := False;
	 else
	    Field (I) := True;
	 end if;
      end loop;
      
      BitMan.Print_Bit_Field (Field);
      
      Iterations := Iterations + 1;
      
   end loop;
   
   Ada.Text_IO.Put_Line ("Equilibrium reached in" & 
                         Natural'Image(Iterations) &
                         " iterations");
   
end Evca;
