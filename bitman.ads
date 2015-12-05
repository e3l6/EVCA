--------------------------------------------------------------------------------
--
-- Eric Laursen, 15 October 2015, CS 441-001 Doodling
--
-- BitMan.ads -- Bit manipulation using an array of Booleans with hard coded
--               magic numbers
--
-- Implementation of Melanie Mitchell's Evolving Cellular Automata with
--    Genetic Algorithms
-- 
--------------------------------------------------------------------------------

with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Interfaces;

package BitMan is
   
   -- Magic number here for size of the array
   subtype Bit_Number is Natural range 0 .. 2**8 - 1;
   
   type Bit_Field is array (Bit_Number) of Boolean
     with Default_Component_Value => False;
   for Bit_Field'Component_size use 1;
   
   procedure Print_Bit_Field (Item : in Bit_Field);
   
   -- Return the number of True bits in Idx's neighborhood. Easier for me to
   --   program off the cuff than slicing and packing the neighborhood and
   --   using a lookup table.
   function Neighborhood_Population (Item : in Bit_Field;
				     Idx  : in Bit_Number) return Natural;
   
end BitMan;
