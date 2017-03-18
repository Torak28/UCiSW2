----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:27:29 03/08/2017 
-- Design Name: 
-- Module Name:    Pila - Behavioral 
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
use IEEE.numeric_std.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Pila is
    Port ( ClkIN : in  STD_LOGIC;
           ClrIN : in  STD_LOGIC;
           
			  ClkOUT : out STD_LOGIC);
end Pila;

architecture Behavioral of Pila is
	signal iterator: integer := 1;
	signal temp : STD_LOGIC := '0';
	
	constant Czestotliwosc : natural := 25000;
begin

-- Nasze podzielenie 50MHz do 1,5KHz
-- period 1667
process( ClkIN, ClrIN, temp )
begin
	if(ClrIN = '1') then 
		iterator <= 1;
		temp <= '0';
	elsif rising_edge(ClkIN)  then
		iterator <= iterator + 1;
		if (iterator = Czestotliwosc) then
			temp <= NOT temp;
			iterator <= 1;
		end if;
	end if;
ClkOUT <= temp;
end process;

end Behavioral;