----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:18:42 03/18/2017 
-- Design Name: 
-- Module Name:    SawTooth - Behavioral 
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

entity SawTooth is
    Port ( ClkIN : in  STD_LOGIC;
           ClrIN : in  STD_LOGIC;
           SawtoothOUT : out  STD_LOGIC_VECTOR(5 downto 0));
end SawTooth;

architecture Behavioral of SawTooth is
	signal iteratorProbek : integer := 0;
	
begin

process(ClockIN, ClrIN)
begin
    if(ClrIN = '1') then
        iteratorProbek <= 0;
    elsif(rising_edge(ClockIN)) then
        if(iteratorProbek = 63) then
            iteratorProbek <= 0;
        else
            iteratorProbek <= iteratorProbek + 1;
        end if;
    end if;
end process;

SawtoothOUT <= conv_std_logic_vector(iteratorProbek,6);

end Behavioral;

