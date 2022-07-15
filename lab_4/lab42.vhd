library ieee;					-- Declare that you want to use IEEE libraries 
use ieee.std_logic_1164.all;	-- Library for standard logic circuits 
use ieee.numeric_std.all; 	-- Another useful library for UNSIGNED numbers 

entity lab42 is 	-- entity definition 
	port( KEY: 		in 	std_logic_vector(3 downto 0); 	-- Push buttons 
			SW: 		in 	std_logic_vector(9 downto 0); 	-- Toggle switches 
			LEDR:		out 	std_logic_vector(9 downto 0); 	-- Red LEDs 
			LEDG:		out 	std_logic_vector(7 downto 0);		-- Green LEDs 
			CLOCK_50_B5B: in std_logic
			); 
end entity lab42;

architecture main of lab42 is 
signal counter: unsigned(31 downto 0);

begin
counter <= counter + 1 when rising_edge(CLOCK_50_B5B);
LEDR(9 downto 0) <= std_logic_vector(counter(31 downto 22));
LEDG(7 downto 0) <= std_logic_vector(counter(21 downto 14));

end architecture main;