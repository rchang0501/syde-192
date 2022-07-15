library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seven_segment is port(
	data_in: in std_logic_vector(3 downto 0);	-- The 4 bit data to be displayed
	blanking: in std_logic;						-- Blank the output if this is input is set to HIGH
	segments_out: out std_logic_vector(6 downto 0) );	-- 7 bits out to a 7-segment display
end entity seven_segment;

architecture behavioral of seven_segment is
begin with blanking & data_in select		-- seven-segment bits are 'a' to 'g'. The LSB is 'a' and MSB is 'g' 
	segments_out(6 downto 0) <= "1000000" when "00000",		-- 0
										 "1111001" when "00001",		-- 1
										 "0100100" when "00010",		-- 2
										 "0110000" when "00011",		-- 3
										 "0011001" when "00100",		-- 4
										 "0010010" when "00101",		-- 5
										 "0000010" when "00110",		-- 6
										 "1111000" when "00111",		-- 7
										 "0000000" when "01000",		-- 8
										 "0010000" when "01001",		-- 9
										 "0001000" when "01010",		-- A
										 "0000011" when "01011",		-- B
										 "1000110" when "01100",		-- C
										 "0100001" when "01101",		-- D
										 "0000110" when "01110",		-- E
										 "0001110" when "01111",		-- F
										 "1111111" when others;
end architecture behavioral;