library ieee;					-- Declare that you want to use IEEE libraries 
use ieee.std_logic_1164.all;	-- Library for standard logic circuits 
use ieee.numeric_std.all; 	-- Another useful library for UNSIGNED numbers 

entity lab43 is 	-- entity definition 
	port( KEY: 		in 	std_logic_vector(3 downto 0); 	-- Push buttons 
			SW: 		in 	std_logic_vector(9 downto 0); 	-- Toggle switches 
			LEDR:		out 	std_logic_vector(9 downto 0); 	-- Red LEDs 
			LEDG:		out 	std_logic_vector(7 downto 0);		-- Green LEDs 
			CLOCK_50_B5B: in std_logic
			); 
end entity lab43;

architecture main of lab43 is
signal modulus_counter: unsigned(24 downto 0);
signal modulus_clock_1_Hz: std_logic;
signal binary_counter: unsigned(25 downto 0);

begin
counting: process (CLOCK_50_B5B)
begin
	if rising_edge(CLOCK_50_B5B) then
		if modulus_counter = to_unsigned(24999999, 25) then
			modulus_counter <= to_unsigned(0, 25);
			modulus_clock_1_Hz <= not modulus_clock_1_Hz;
			LEDG(5) <= modulus_clock_1_Hz;
		else
			modulus_counter <= modulus_counter + 1;
		end if;
	end if;
end process;
binary_counter <= binary_counter + 1 when rising_edge(CLOCK_50_B5B);
LEDR(0) <= std_logic(binary_counter(25));
end architecture main;