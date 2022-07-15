library ieee;					-- Declare that you want to use IEEE libraries 
use ieee.std_logic_1164.all;	-- Library for standard logic circuits 
-- use ieee.numeric_std.all; 	-- Another useful library for UNSIGNED numbers 

entity lab2_44 is 	-- entity definition 
	port( KEY: 		in 	std_logic_vector(3 downto 0); 	-- Push buttons 
			SW: 		in 	std_logic_vector(9 downto 0); 	-- Toggle switches 
			LEDR:		out 	std_logic_vector(9 downto 0); 	-- Red LEDs 
			LEDG:		out 	std_logic_vector(7 downto 0)		-- Green LEDs 
			); 
end entity lab2_44;

architecture main of lab2_44 is 
signal a0, a1, b0, b1:		std_logic; 
signal c2, c1, c0, cout_1:			std_logic;

component Full_adder is
	port(
		i1, i2, cin: in	std_logic;
		s, cout: out		std_logic
	);
end component;

begin
a0<= SW(0);
a1<= SW(1);
b0<= SW(8);
b1<= SW(9);
component_1: entity work.Full_adder(RTL) port map(a0, b0, '0', c2, cout_1);
component_2: entity work.Full_adder(RTL) port map(a1, b1, cout_1, c1, c0);

LEDR(0)<= c2;
LEDR(1)<= c1;
LEDR(2)<= c0;

end architecture main;