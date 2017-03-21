-- Vhdl test bench created from schematic D:\Dropbox\Studiowanie\VI semestr\UCiSW2\Ola_Jarek\s7.sch - Tue Mar 21 19:54:05 2017
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
ENTITY s7_s7_sch_tb IS
END s7_s7_sch_tb;
ARCHITECTURE behavioral OF s7_s7_sch_tb IS 

   COMPONENT s7
   PORT( ClkIN		:	IN	STD_LOGIC; 
          ClrIN	:	IN	STD_LOGIC; 
          Wyjscie	:	OUT	STD_LOGIC_VECTOR (11 DOWNTO 0); 
          Start	:	OUT	STD_LOGIC; 
          Cmd		:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          Addr		:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0));
   END COMPONENT;
	
	--Wejscie
   SIGNAL ClkIN	:	STD_LOGIC;
   SIGNAL ClrIN	:	STD_LOGIC;
	
	--Wyjscie
   SIGNAL Wyjscie	:	STD_LOGIC_VECTOR (11 DOWNTO 0);
   SIGNAL Start	:	STD_LOGIC;
   SIGNAL Cmd		:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL Addr		:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	
	--Okres 50MHz
   constant Clock_period : time := 20ns;

BEGIN

   UUT: s7 PORT MAP(
		ClkIN => ClkIN, 
		ClrIN => ClrIN, 
		Wyjscie => Wyjscie, 
		Start => Start, 
		Cmd => Cmd, 
		Addr => Addr
   );

	-- 50MHz
    Clock_process :process
    begin
        ClkIN <= '0';
        wait for Clock_period/2;
        ClkIN <= '1';
        wait for Clock_period/2;
    end process;
     
    -- Symulacja
    ClrIN <= '0';

END;
