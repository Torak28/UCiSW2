----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:59:04 05/15/2017 
-- Design Name: 
-- Module Name:    ChooseSrc - Behavioral 
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
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ChooseSrc is
    Port ( Clr       : in  STD_LOGIC;
           WrtIN     : in  STD_LOGIC;
           RdIN      : in  STD_LOGIC;
           Address  	: out STD_LOGIC_VECTOR(9 downto 0);
           WrtOUT    : out STD_LOGIC;
			  Enable    : out STD_LOGIC;
           RdOUT     : out STD_LOGIC;
			  Clk100		: out STD_LOGIC;
			  Clk			: in STD_LOGIC
           );

end ChooseSrc;

-- http://www.deathbylogic.com/2013/02/vhdl-ram/

architecture Behavioral of ChooseSrc is   
 
	signal iFreqDiv      : integer   := 1;
	signal tmpFreqDiv    : STD_LOGIC := '0';
	
	-- 100 Hz z 50MHz
   signal Freq          : integer   := 250000;
	signal ClkTemp       : STD_LOGIC;
	signal count 			: STD_LOGIC_VECTOR(9 downto 0)  := (others=>'0');
	
	signal tmp 			: STD_LOGIC;
 
begin

CloclProc: process( Clk, Clr, tmpFreqDiv )
begin
	if(Clr = '1' ) or (Freq = 0) then 
		iFreqDiv <= 1;
		tmpFreqDiv <= '0';
	elsif rising_edge(Clk)  then
		if (iFreqDiv = Freq) then
			tmpFreqDiv <= NOT tmpFreqDiv;
			iFreqDiv <= 1;
      else
         iFreqDiv <= iFreqDiv + 1;
		end if;
	end if;
ClkTemp <= tmpFreqDiv;
end process;

AddressProce : process(ClkTemp, Clr)
begin	
		if(Clr = '1') then
			count <= (others=>'0');
		elsif (rising_edge(ClkTemp)) then
			count <= count + 1;	
		end if;
end process;

RdWrProc : process(RdIN, WrtIN)
begin
--	Dla Rd = 0 i Wrt = 0 jest normalne granie
--	dla Rd = 1 i Wrt = 0 Czytanie z pamieci
--	dla Rd = 0 i Wrt = 1 Do pamieci
--	dla Rd = 1 i Wrt = 1 nic nie zmieniamy
	if(RdIN = '0' and WrtIN = '0') then
		RdOUT <= '0';
		WrtOUT <= '0';
	elsif(RdIN = '1' and WrtIN = '0') then
		RdOUT <= '1';
		WrtOUT <= '0';
	elsif(RdIN = '0' and WrtIN = '1') then
		RdOUT <= '0';
		WrtOUT <= '1';
	end if;
end process;

Address <= count;
Clk100 <= ClkTemp;
Enable <= '1';

end Behavioral;

