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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Pila is
    Port ( Clk : in  STD_LOGIC;
           Clr : in  STD_LOGIC;
           Start : in STD_LOGIC; -- Na razie tak sobie tu bêdzie nic nie robi³
           sygnalWyjsciowy : out  STD_LOGIC_VECTOR(5 downto 0));
end Pila;

architecture Behavioral of Pila is
   signal iteratorProbek : integer := 0;
   signal Wyjscie6 : STD_LOGIC_VECTOR(5 downto 0);
   constant Freq : natural := 1500000000;
   signal ClkProbki : STD_LOGIC; 
begin

proces1 : process( Clk, Clr )
   variable iterator : natural range 0 to Freq;
begin
   if Clr = '0' then
      iterator := 0;
      ClkProbki    <= '1';
   elsif rising_edge(Clk) then
      if iterator < (Freq/2)-1 then
         ClkProbki    <= '1';
         iterator := iterator + 1;
      elsif iterator < Freq-1 then
         ClkProbki    <='0';
         iterator := iterator + 1;
      else
         iterator := 0;
         ClkProbki    <='1';
      end if;
   end if;   
end process;

proces2 : process( ClkProbki, Clr )
begin
    if(Clr = '1') then
        iteratorProbek <= 0;
    elsif(rising_edge(ClkProbki)) then -- Inny warunek, uzalezniony od drugiego licznika
        if(iteratorProbek = 63) then
            iteratorProbek <= 0;
        else
            iteratorProbek <= iteratorProbek + 1;
        end if;
    end if;
end process;

sygnalWyjsciowy <= conv_std_logic_vector(iteratorProbek,6); -- to przepisac na sygnalWyjsciowy(najstarsze 6 bitow)

end Behavioral;

