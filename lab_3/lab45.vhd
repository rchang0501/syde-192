library ieee;					-- Declare that you want to use IEEE libraries 
use ieee.std_logic_1164.all;	-- Library for standard logic circuits 
use ieee.numeric_std.all; 	-- Another useful library for UNSIGNED numbers 

entity lab45 is 	-- entity definition 
	port( KEY: 		in 	std_logic_vector(3 downto 0); 	-- Push buttons 
			SW: 		in 	std_logic_vector(9 downto 0); 	-- Toggle switches 
			LEDR:		out 	std_logic_vector(9 downto 0); 	-- Red LEDs 
			LEDG:		out 	std_logic_vector(7 downto 0);		-- Green LEDs 
			hex3, hex2, hex1, hex0: out std_logic_vector(6 downto 0)
			); 
end entity lab45;

architecture main of lab45 is
signal add_out: std_logic_vector(4 downto 0);
signal sum: std_logic_vector(3 downto 0);
signal carry: std_logic;
signal mult_out, full_out: std_logic_vector(7 downto 0);
signal x, y: std_logic_vector(3 downto 0);

component Four_bits_adder is
port( num1, num2: in std_logic_vector(3 downto 0);
		sum: out std_logic_vector(3 downto 0);
		cout4: out std_logic

);
end component;

component seven_segment is
port(data_in:		in std_logic_vector(3 downto 0);	-- The 4 bit data to be displayed
			blanking:		in std_logic;						-- Blank the output if this is input is set to HIGH
			segments_out: 	out std_logic_vector(6 downto 0) );	-- 7 bits out to a 7-segment display
end component;

component Four_bits_multiplier is
port( mult1, mult2: in std_logic_vector(3 downto 0);
		m: out std_logic_vector(7 downto 0)
);
end component;
begin

x(3 downto 0) <=SW(3 downto 0);
y(3 downto 0) <=SW(9 downto 6);

addition_inst: entity work.Four_bits_adder(RTL) port map(x ,y, sum, carry);
mult_inst: entity work.Four_bits_multiplier(RTL) port map(x, y, mult_out);
add_out(4) <=carry;
add_out(3 downto 0) <=sum(3 downto 0);
full_out <="000" & add_out when SW(5) = '0' else mult_out;

hex3_inst: entity work.seven_segment(behavioral) port map(x, '0', hex3);
hex2_inst: entity work.seven_segment(behavioral) port map(y, '0', hex2);
hex1_inst: entity work.seven_segment(behavioral) port map(full_out(7 downto 4), '0', hex1);
hex0_inst: entity work.seven_segment(behavioral) port map(full_out(3 downto 0), '0', hex0);

end architecture main;

