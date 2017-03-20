-- Vhdl test bench created from schematic D:\Dropbox\Studiowanie\VI semestr\UCiSW2\Ola_Jarek\s6.sch - Sat Mar 18 17:28:29 2017
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
ENTITY s6_s6_sch_tb IS
END s6_s6_sch_tb;
ARCHITECTURE behavioral OF s6_s6_sch_tb IS 

   COMPONENT s6
   PORT( 	Clr	:	IN	STD_LOGIC; 
          Clock	:	IN	STD_LOGIC; 
          Wyjscie	:	OUT	STD_LOGIC_VECTOR (5 DOWNTO 0));
   END COMPONENT;

	--Wejscie
   SIGNAL Clr	:	STD_LOGIC;
   SIGNAL Clock	:	STD_LOGIC;
	
	--Wyjscie
   SIGNAL Wyjscie	:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	
	--Okres 50MHz
	constant Clock_period : time := 20ns;

BEGIN

   UUT: s6 PORT MAP(
		Clr => Clr, 
		Clock => Clock, 
		Wyjscie => Wyjscie
   );

	-- 50MHz
	Clock_process :process
	begin
		Clock <= '0';
		wait for Clock_period/2;
		Clock <= '1';
		wait for Clock_period/2;
	end process;
	 
	-- Symulacja
	Clr <= '0';

END;
