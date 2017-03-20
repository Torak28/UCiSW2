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
			  
           SawtoothOUT : out  STD_LOGIC_VECTOR(5 downto 0);
           StartOUT : out  STD_LOGIC);
end SawToothDivider;

architecture Behavioral of SawToothDivider is
	signal iteratorDzielnikaCzestotliwosci: integer := 1;
	signal tempDzielnikaCzestotliwosci : STD_LOGIC := '0';
	
	--Wersja testowa do której mam dane, docelowo 16667
	constant czestotliwoscSygnalu : natural := 25000;
	
	signal ClkDzielnikaCzestotliwosci : STD_LOGIC;
	
	signal iteratorGeneratoraPily : integer := 0;
begin

-- Nasze podzielenie 50MHz do 1,5KHz
-- period 16667
DzielnikCzestotliwosci: process( Clk, Clr, tempDzielnikaCzestotliwosci )
begin
	if(Clr = '1') then 
		iteratorDzielnikaCzestotliwosci <= 1;
		tempDzielnikaCzestotliwosci <= '0';
	elsif rising_edge(Clk)  then
		iteratorDzielnikaCzestotliwosci <= iteratorDzielnikaCzestotliwosci + 1;
		if (iteratorDzielnikaCzestotliwosci = czestotliwoscSygnalu) then
			tempDzielnikaCzestotliwosci <= NOT tempDzielnikaCzestotliwosci;
			iteratorDzielnikaCzestotliwosci <= 1;
		end if;
	end if;
ClkDzielnikaCzestotliwosci <= tempDzielnikaCzestotliwosci;
end process;

-- Pila
GeneratorPily: process( ClkDzielnikaCzestotliwosci, Clr )
begin
	if(Clr = '1') then
        iteratorGeneratoraPily <= 0;
    elsif(rising_edge(ClkDzielnikaCzestotliwosci)) then
        if(iteratorGeneratoraPily = 63) then
            iteratorGeneratoraPily <= 0;
        else
            iteratorGeneratoraPily <= iteratorGeneratoraPily + 1;
        end if;
    end if;
end process;

SawtoothOUT <= conv_std_logic_vector(iteratorGeneratoraPily,6);

end Behavioral;

