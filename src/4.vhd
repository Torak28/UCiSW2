----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:15:51 03/20/2017 
-- Design Name: 
-- Module Name:    SawToothDivider - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SawToothDivider is
    Port ( Clk : in  STD_LOGIC;
           Clr : in  STD_LOGIC;
			  
           StartOUT 		: out  STD_LOGIC;
			  CmdOUT 		: out  STD_LOGIC_VECTOR (3 downto 0);
           AddrOUT 		: out  STD_LOGIC_VECTOR (3 downto 0);
			  
			  SawtoothOUT 	: out  STD_LOGIC_VECTOR (11 downto 0));
end SawToothDivider;

architecture Behavioral of SawToothDivider is
	signal iFreqDiv: integer := 1;
	signal tmpFreqDiv : STD_LOGIC := '0';
	
	-- Wersja testowa do której mam dane, docelowo 16667
	constant Freq : natural := 16667;
	
	-- Zmienne
	signal ClkSawTooth 	: STD_LOGIC;
	signal iSawGen 		: integer := 0;
	signal Cmd 				: integer := 2;
	signal Addr 			: integer := 3;
begin

-- Nasze podzielenie 50MHz do 1,5KHz
-- period 16667
FreqDiv: process( Clk, Clr, tmpFreqDiv )
begin
	if(Clr = '1') then 
		iFreqDiv <= 1;
		tmpFreqDiv <= '0';
	elsif rising_edge(Clk)  then
		iFreqDiv <= iFreqDiv + 1;
		StartOUT <= '0';
		if (iFreqDiv = Freq) then
			tmpFreqDiv <= NOT tmpFreqDiv;
			StartOUT <= '1';
			iFreqDiv <= 1;
		end if;
	end if;
ClkSawTooth <= tmpFreqDiv;
end process;

-- Pila
SawToothGen: process( ClkSawTooth, Clr )
begin
	if(Clr = '1') then
        iSawGen <= 0;
    elsif(rising_edge(ClkSawTooth)) then
        if(iSawGen = 63) then
            iSawGen <= 0;
        else
            iSawGen <= iSawGen + 1;
        end if;
    end if;
end process;

CmdOUT <= conv_std_logic_vector(Cmd,4);
AddrOUT <= conv_std_logic_vector(Addr,4);
SawtoothOUT <= conv_std_logic_vector(iSawGen,6) & "000000";

end Behavioral;

