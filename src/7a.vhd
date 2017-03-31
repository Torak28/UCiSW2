----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:43:25 03/22/2017 
-- Design Name: 
-- Module Name:    Freq - Behavioral 
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

entity FreqButton is
    Port ( Clr       : in  STD_LOGIC;
           A         : in  STD_LOGIC;
           B         : in  STD_LOGIC;
           C         : in  STD_LOGIC;
           FreqOUT   : out  STD_LOGIC_VECTOR(3 downto 0));
end FreqButton;

architecture Behavioral of FreqButton is
  signal tmp      : integer;
begin
process(A,B,C,Clr,tmp)
begin
  if(Clr = '1') then 
    tmp <= 0; --czy aby na pewno tak?
  elsif (A = '1') then
      tmp <= 1;
   elsif (B = '1') then
      tmp <= 2;
   elsif (C = '1') then
      tmp <= 3;
   else
      tmp <= 0;
   end if;
FreqOUT <= conv_std_logic_vector(tmp,4);
end process;
end Behavioral;

