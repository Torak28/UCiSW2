LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity RAM is
	Port ( 
		Clock 	: in  STD_LOGIC;
      Clr 		: in  STD_LOGIC;
		DataIn 	: in  STD_LOGIC_VECTOR (3 downto 0); --3
		Address	: in  STD_LOGIC_VECTOR (9 downto 0); --9
		WrtIN		: in  STD_LOGIC;
		RdIN		: in  STD_LOGIC;
		Enable 	: in  STD_LOGIC;
		DataOut 	: out STD_LOGIC_VECTOR (3 downto 0) --3
	);
end RAM;

architecture Behavioral of RAM is
	type Memory_Array is array ( 1023 downto 0 ) of STD_LOGIC_VECTOR (3 downto 0);
	signal Memory : Memory_Array := (X"1", X"2", X"3", X"4", X"5", X"6",
												X"7", X"8", X"9", X"A", X"B", X"C",
												X"D", X"E", X"F", X"1", X"2", X"3",
												X"4", X"5", X"6", X"7", X"8", X"9",
												X"A", X"B", X"C", X"D", X"E", X"F",
												X"1", X"2", X"3", X"4", X"5", X"6",
												X"7", X"8", X"9", X"A", X"B", X"C",
												X"D", X"E", X"F", X"1", X"2", X"3",
												X"4", X"5", X"6", X"7", X"8", X"9",
												X"A", X"B", X"C", X"D", X"E", X"F",
												X"1", X"2", X"3", X"4", X"5", X"6",
												X"7", X"8", X"9", X"A", X"B", X"C",
												X"D", X"E", X"F", X"1", X"2", X"3",
												X"4", X"5", X"6", X"7", X"8", X"9",
												X"A", X"B", X"C", X"D", X"E", X"F",
												X"1", X"2", X"3", X"4", X"5", X"6",
												X"7", X"8", X"9", X"A", X"B", X"C",
												X"D", X"E", X"F", X"1", X"2", X"3",
												X"4", X"5", X"6", X"7", X"8", X"9",
												X"A", X"B", X"C", X"D", X"E", X"F",
												X"1", X"2", X"3", X"4", X"5", X"6",
												X"7", X"8", X"9", X"A", X"B", X"C",
												X"D", X"E", X"F", X"1", X"2", X"3",
												X"4", X"5", X"6", X"7", X"8", X"9",
												X"A", X"B", X"C", X"D", X"E", X"F",
												X"1", X"2", X"3", X"4", X"5", X"6",
												X"7", X"8", X"9", X"A", X"B", X"C",
												X"D", X"E", X"F", X"1", X"2", X"3",
												X"4", X"5", X"6", X"7", X"8", X"9",
												X"A", X"B", X"C", X"D", X"E", X"F",
												X"1", X"2", X"3", X"4", X"5", X"6",
												X"7", X"8", X"9", X"A", X"B", X"C",
												X"D", X"E", X"F", X"1", X"2", X"3",
												X"4", X"5", X"6", X"7", X"8", X"9",
												X"A", X"B", X"C", X"D", X"E", X"F",
												X"1", X"2", X"3", X"4", X"5", X"6",
												X"7", X"8", X"9", X"A", X"B", X"C",
												X"D", X"E", X"F", X"1", X"2", X"3",
												X"4", X"5", X"6", X"7", X"8", X"9",
												X"A", X"B", X"C", X"D", X"E", X"F",
												X"1", X"2", X"3", X"4", X"5", X"6",
												X"7", X"8", X"9", X"A", X"B", X"C",
												X"D", X"E", X"F", X"1", X"2", X"3",
												X"4", X"5", X"6", X"7", X"8", X"9",
												X"A", X"B", X"C", X"D", X"E", X"F",
												X"1", X"2", X"3", X"4", X"5", X"6",
												X"7", X"8", X"9", X"A", X"B", X"C",
												X"D", X"E", X"F", X"1", X"2", X"3",
												X"4", X"5", X"6", X"7", X"8", X"9",
												X"A", X"B", X"C", X"D", X"E", X"F",
												X"1", X"2", X"3", X"4", X"5", X"6",
												X"7", X"8", X"9", X"A", X"B", X"C",
												X"D", X"E", X"F", X"1", X"2", X"3",
												X"4", X"5", X"6", X"7", X"8", X"9",
												X"A", X"B", X"C", X"D", X"E", X"F",
												X"1", X"2", X"3", X"4", X"5", X"6",
												X"7", X"8", X"9", X"A", X"B", X"C",
												X"D", X"E", X"F", X"1", X"2", X"3",
												X"4", X"5", X"6", X"7", X"8", X"9",
												X"A", X"B", X"C", X"D", X"E", X"F",
												X"1", X"2", X"3", X"4", X"5", X"6",
												X"7", X"8", X"9", X"A", X"B", X"C",
												X"D", X"E", X"F", X"1", X"2", X"3",
												X"4", X"5", X"6", X"7", X"8", X"9",
												X"A", X"B", X"C", X"D", X"E", X"F",
												X"1", X"2", X"3", X"4", X"5", X"6",
												X"7", X"8", X"9", X"A", X"B", X"C",
												X"D", X"E", X"F", X"1", X"2", X"3",
												X"4", X"5", X"6", X"7", X"8", X"9",
												X"A", X"B", X"C", X"D", X"E", X"F",
												X"1", X"2", X"3", X"4", X"5", X"6",
												X"7", X"8", X"9", X"A", X"B", X"C",
												X"D", X"E", X"F", X"1", X"2", X"3",
												X"4", X"5", X"6", X"7", X"8", X"9",
												X"A", X"B", X"C", X"D", X"E", X"F",
												X"1", X"2", X"3", X"4", X"5", X"6",
												X"7", X"8", X"9", X"A", X"B", X"C",
												X"D", X"E", X"F", X"1", X"2", X"3",
												X"4", X"5", X"6", X"7", X"8", X"9",
												X"A", X"B", X"C", X"D", X"E", X"F",
												others => X"6");                        
begin

	-- Read
	process (Clock)
	begin
		if rising_edge(Clock) then
			if Clr = '1' then
				-- Puszczamy ciszê
				DataOut <= (others => '0');
			elsif Enable = '1' then
				if RdIN = '1' then
					-- Jak chcemy czytaæ to na wyjœcie leci Pamiêæ
					DataOut <= Memory(to_integer(unsigned(Address)));
				else
					-- Jak dzia³amy a nie odczytujemy, to znaczy ¿e zapisujemy, czyli chcemy s³yszeæ
					DataOut <= DataIn;
				end if;
			end if;
		end if;
	end process;

	-- Write
	process (Clock)
	begin
		if rising_edge(Clock) then
			if Clr = '1' then
				-- Czyscimy calosc pamieci
				for i in Memory'Range loop
					Memory(i) <= (others => '0');
				end loop;
			elsif Enable = '1' then
				if WrtIN = '1' then
					-- Jak jest to coœ to zapisujemy!
					Memory(to_integer(unsigned(Address))) <= DataIn;
				end if;
			end if;
		end if;
	end process;

end Behavioral;