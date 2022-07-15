library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all; 

entity elevator_control is 
	port(
		SW: in std_logic_vector(3 downto 0); 
		LEDR: out std_logic_vector(1 downto 0)
	); 
end entity elevator_control; 

architecture main of elevator_control is 
signal A, B, Y, Z, E, D: std_logic; 

begin
A <= SW(0); 
B <= SW(1); 
Y <= SW(2); 
Z <= SW(3); 

E <= (B and Y) xor (A and Z); 
D <= not(A) or (Y and Z);

LEDR(0) <= E; 
LEDR(1) <= D; 

end architecture main; 