library ieee;					-- Declare that you want to use IEEE libraries 
use ieee.std_logic_1164.all;	-- Library for standard logic circuits 
use ieee.numeric_std.all; 	-- Another useful library for UNSIGNED numbers 

entity lab41 is 	-- entity definition 
	port( KEY: 		in 	std_logic_vector(3 downto 0); 	-- Push buttons 
			SW: 		in 	std_logic_vector(9 downto 0); 	-- Toggle switches 
			LEDR:		out 	std_logic_vector(9 downto 0); 	-- Red LEDs 
			LEDG:		out 	std_logic_vector(7 downto 0);		-- Green LEDs 
			hex3, hex2, hex1, hex0: out std_logic_vector(6 downto 0)
			); 
end entity lab41; 

architecture main of lab41 is
signal counter: unsigned(4 downto 0);
signal full_out: std_logic_vector(7 downto 0);

component seven_segment is
port(data_in:		in std_logic_vector(3 downto 0);	-- The 4 bit data to be displayed
			blanking:		in std_logic;						-- Blank the output if this is input is set to HIGH
			segments_out: 	out std_logic_vector(6 downto 0) );	-- 7 bits out to a 7-segment display
end component;

begin
	counter <= counter + 1 when rising_edge(KEY(0));
	full_out <= "000" & std_logic_vector(counter);
	hex1_inst: entity work.seven_segment(behavioral) port map(full_out(7 downto 4), '0', hex1);
	hex0_inst: entity work.seven_segment(behavioral) port map(full_out(3 downto 0), '0', hex0);
	hex2_inst: entity work.seven_segment(behavioral) port map("0000", '1', hex2);
	hex3_inst: entity work.seven_segment(behavioral) port map("0000", '1', hex3);
end architecture main;

