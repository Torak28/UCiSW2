-- Vhdl test bench created from schematic C:\XilinxPrj\Ola_Jarek\s1.sch - Wed Mar 08 10:55:29 2017
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
ENTITY s1_s1_sch_tb IS
END s1_s1_sch_tb;
ARCHITECTURE behavioral OF s1_s1_sch_tb IS 

   COMPONENT s1
   PORT( Clr	:	IN	STD_LOGIC; 
          Clock	:	IN	STD_LOGIC; 
          Wyjscie	:	OUT	STD_LOGIC_VECTOR (5 DOWNTO 0));
   END COMPONENT;

   SIGNAL Clr	:	STD_LOGIC;
   SIGNAL Clock	:	STD_LOGIC;
   SIGNAL Wyjscie	:	STD_LOGIC_VECTOR (5 DOWNTO 0);

BEGIN

   UUT: s1 PORT MAP(
		Clr => Clr, 
		Clock => Clock, 
		Wyjscie => Wyjscie
   );

-- *** Test Bench - User Defined Section ***
   
-- *** End Test Bench - User Defined Section ***

END;
