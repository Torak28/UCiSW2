-- Vhdl test bench created from schematic D:\Dropbox\Studiowanie\VI semestr\UCiSW2\Ola_Jarek\s5.sch - Sat Mar 18 16:37:30 2017
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY s5_s5_sch_tb IS
END s5_s5_sch_tb;
ARCHITECTURE behavioral OF s5_s5_sch_tb IS 

   COMPONENT s5
   PORT( ClockIN	:	IN	STD_LOGIC; 
				Clr	:	IN	STD_LOGIC; 
         ClockOUT	:	OUT	STD_LOGIC);
   END COMPONENT;

	--Wejscie
   SIGNAL ClockIN	:	STD_LOGIC;
   SIGNAL Clr	:	STD_LOGIC;
	
	--Wyjscie
   SIGNAL ClockOUT	:	STD_LOGIC;
	
	--Okres 50MHz
	constant Clock_period : time := 20ns;

BEGIN

   UUT: s5 PORT MAP(
		ClockIN => ClockIN, 
		Clr => Clr, 
		ClockOUT => ClockOUT
   );

	-- 50MHz
	Clock_process :process
	begin
		ClockIN <= '0';
		wait for Clock_period/2;
		ClockIN <= '1';
		wait for Clock_period/2;
	end process;
	 
	-- Symulacja
	Clr <= '0';

END;
