--------------------------------------------------------------------------------
--
-- Eric Laursen, 15 October 2015, CS 441-001 Doodling
--
-- BitMan.adb -- Bit manipulation using an array of Booleans with hard coded
--               magic numbers
--
-- Implementation of Melanie Mitchell's Evolving Cellular Automata with
--    Genetic Algorithms
-- 
--------------------------------------------------------------------------------

package body BitMan is
   
   -- Print_Bit_Field
   -- Input:   Bit_Field
   -- Output:  stdout
   -- Changes: none
   
   procedure Print_Bit_Field (Item : in Bit_Field) is
      
      Line_Disp_Len : Natural := 0;
      
   begin
      
      for I in Bit_Number'Range loop
	 Ada.Integer_Text_IO.Put (Boolean'Pos (Item (I)), 1);
	 Line_Disp_Len := Line_Disp_Len + 1;
	 
	 if Line_Disp_Len >= 64 then
	    Ada.Text_IO.New_Line;
	    Line_Disp_Len := 0;
	 end if;
      end loop;
      
      -- Ada.Text_IO.New_Line;
      Ada.Text_IO.New_Line;

   end Print_Bit_Field;
   
   
   
   -- Neighborhood_Population - determine nr. of True bits in the neighborhood
   --   of bit Idx
   -- Input:   Item : Bit_Field, Idx : Bit_Number
   -- Output:  Natural
   -- Changes: none
   
   function Neighborhood_Population (Item : in Bit_Field;
                                     Idx  : in Bit_Number) return Natural is
      Population : Natural := 0;
      
   begin
      
      -- Magic numbers here for neighborhood size. Neighborhood size for each
      --   bit is 3, that is itself and the immediately adjacent bits.
      -- Adding the largest Bit_Number value + 1 for the loop and then modding
      --   the loop variable prevents weirdness at array positions 0 and 
      --   Bit_Number'Last. Otherwise the loop would count from Bit_Number'Last
      --   down to 0 when checking the neighbors to the beginning and end.
      
      for I in (Idx + (Bit_Number'Last + 1) - 1) ..
	(Idx + (Bit_Number'Last + 1) + 1) loop
	 
	 if Item (I mod(Bit_Number'Last + 1)) = True then
	    Population := Population + 1;
	 end if;
	 
      end loop;
      
      return Population;
      
   end Neighborhood_Population;
   
end BitMan;
