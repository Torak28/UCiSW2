----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:15:21 05/12/2017 
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

entity Freq is
	Port ( Clr       : in  STD_LOGIC;
          Clk       : in  STD_LOGIC;
          F0        : in  STD_LOGIC;
          IN_klaw   : in  STD_LOGIC_VECTOR(7 downto 0);
          K_rdy     : in  STD_LOGIC;
          FreqOUT   : out STD_LOGIC_VECTOR(3 downto 0));
end Freq;

architecture Behavioral of Freq is
	signal tmp 						: integer; --flaga wcisniecia F0
	-- Z jako nagranie i X jako odtwarzanie
   type state_type is ( XD, A, W, S, E, D, F, T, G, Y, H, U, J, Z, X, A2, W2, S2 );
   signal state, next_state 	: state_type;
	type nagranieT is array (0 to 100) of STD_LOGIC_VECTOR(3 downto 0);
	signal nagranie 				: nagranieT;
	signal sizeN			 		: integer := 0;
begin
Mng : process( Clk, tmp )
   begin
      if rising_edge( Clk ) then
         if Clr = '1' then
            state <= XD;
            tmp <= 0;
         else
            state <= next_state;
         end if;
      end if;
   end process Mng;
   
StMch : process( state, IN_klaw, K_rdy, tmp )
   begin
      next_state <= state; -- by default
      case state is      
         when XD =>
            if K_rdy = '1' and IN_klaw = X"1C" then
               next_state <= A;
            elsif K_rdy = '1' and IN_klaw = X"1D" then
               next_state <= W;
            elsif K_rdy = '1' and IN_klaw = X"1B" then
               next_state <= S;
            elsif K_rdy = '1' and IN_klaw = X"24" then
               next_state <= E;
            elsif K_rdy = '1' and IN_klaw = X"23" then
               next_state <= D;
            elsif K_rdy = '1' and IN_klaw = X"2B" then
               next_state <= F;
            elsif K_rdy = '1' and IN_klaw = X"2C" then
               next_state <= T;
            elsif K_rdy = '1' and IN_klaw = X"34" then
               next_state <= G;
            elsif K_rdy = '1' and IN_klaw = X"35" then
               next_state <= Y;
            elsif K_rdy = '1' and IN_klaw = X"33" then
               next_state <= H;
            elsif K_rdy = '1' and IN_klaw = X"3C" then
               next_state <= U;
            elsif K_rdy = '1' and IN_klaw = X"3B" then
               next_state <= J;
				-- Wciniete Z, czyli nagrywanie
				elsif K_rdy = '1' and IN_klaw = X"1A" then
               next_state <= Z;
				elsif K_rdy = '1' and IN_klaw = X"22" then
               next_state <= X;
            elsif K_rdy = '1' then
               next_state <= XD;
            end if;
			-- Nagrywanie w pelnej krasie
			when Z =>
				if K_rdy = '1' and IN_klaw = X"1C" then
               next_state <= A2;
				elsif K_rdy = '1' and IN_klaw = X"1D" then
               next_state <= W2;
				elsif K_rdy = '1' and IN_klaw = X"1B" then
               next_state <= S2;
				-- wyjscie z nagrwania poprzez wcisniecie ponownie Z
				elsif K_rdy = '1' and IN_klaw = X"1A" then
               next_state <= XD;
				elsif K_rdy = '1' then
               next_state <= XD;
            end if;
			-- Wracnie w odtwarzaniu
			when X =>
				if F0 = '1' then
               next_state <= Z;
            end if;
         when A =>
            if F0 = '1' then
               next_state <= XD;
            end if;
         when W =>
            if F0 = '1' then
               next_state <= XD;
            end if;
         when S =>
            if F0 = '1' then
               next_state <= XD;
            end if;
         when E =>
            if F0 = '1' then
               next_state <= XD;
            end if;
         when D =>
            if F0 = '1' then
               next_state <= XD;
            end if;
         when F =>
            if F0 = '1' then
               next_state <= XD;
            end if;
         when T =>
            if F0 = '1' then
               next_state <= XD;
            end if;
         when G =>
            if F0 = '1' then
               next_state <= XD;
            end if;
         when Y =>
            if F0 = '1' then
               next_state <= XD;
            end if;
         when H =>
            if F0 = '1' then
               next_state <= XD;
            end if;
         when U =>
            if F0 = '1' then
               next_state <= XD;
            end if;
         when J =>
            if F0 = '1' then
               next_state <= XD;
            end if;
			when A2 =>
				-- tutaj zapis do tabilcy o tym ze jestesmy w A2
				nagranie(sizeN) <= conv_std_logic_vector(1,4);
				sizeN <= sizeN + 1;
            if F0 = '1' then
               next_state <= Z;
            end if;
			when W2 =>
				-- tutaj zapis do tabilcy o tym ze jestesmy w W2
				nagranie(sizeN) <= conv_std_logic_vector(2,4);
				sizeN <= sizeN + 1;
            if F0 = '1' then
               next_state <= Z;
            end if;
			when S2 =>
				-- tutaj zapis do tabilcy o tym ze jestesmy w S2
				nagranie(sizeN) <= conv_std_logic_vector(3,4);
				sizeN <= sizeN + 1;
            if F0 = '1' then
               next_state <= Z;
            end if;
      end case;
end process StMch;
    
OutPr : process ( state, Clk )
		variable iter : integer := 0;
   begin
      case state is
         when A =>
            FreqOUT <= conv_std_logic_vector(1,4);
         when W =>
            FreqOUT <= conv_std_logic_vector(2,4);
         when S =>
            FreqOUT <= conv_std_logic_vector(3,4);
         when E =>
            FreqOUT <= conv_std_logic_vector(4,4);
         when D =>
            FreqOUT <= conv_std_logic_vector(5,4);
         when F =>
            FreqOUT <= conv_std_logic_vector(6,4);
         when T =>
            FreqOUT <= conv_std_logic_vector(7,4);
         when G =>
            FreqOUT <= conv_std_logic_vector(8,4);
         when Y =>
            FreqOUT <= conv_std_logic_vector(9,4);
         when H =>
            FreqOUT <= conv_std_logic_vector(10,4);
         when U =>
            FreqOUT <= conv_std_logic_vector(11,4);
         when J =>
            FreqOUT <= conv_std_logic_vector(12,4);
         when XD =>
            FreqOUT <= conv_std_logic_vector(0,4);
			when A2 =>
            FreqOUT <= conv_std_logic_vector(0,4);
			when W2 =>
            FreqOUT <= conv_std_logic_vector(0,4);
			when S2 =>
            FreqOUT <= conv_std_logic_vector(0,4);
			when Z =>
            FreqOUT <= conv_std_logic_vector(0,4);
			when X =>
				-- Odtwarzanie po ca³osci
            --FreqOUT <= conv_std_logic_vector(0,4);
				for I in 0 to sizeN loop
					FreqOUT <= nagranie(I), conv_std_logic_vector(0,4) after 30 ns;
				end loop;
				
         end case;
   end process OutPr;

end Behavioral;

