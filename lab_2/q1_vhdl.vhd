library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all; 

entity q1_vhdl is 
	port(
		KEY: in std_logic_vector(3 downto 0);
		SW: in std_logic_vector(9 downto 0); 
		LEDR: out std_logic_vector(9 downto 0); 
		LEDG: out std_logic_vector(7 downto 0)
	); 
end entity q1_vhdl; 

architecture main of q1_vhdl is 
signal a0, a1, b0, b1, p0, p1, p2, p3: std_logic; 

begin
a0 <= SW(0); 
a1 <= SW(1); 
b0 <= SW(2); 
b1 <= SW(3); 

p0 <= a0 and b0; 
p1 <= ((a0 and b1) and (not (b0 and a1))) or ((not (a0 and b1)) and (b0 and a1)); 
p2 <= not (a0 and b0) and (a1 and b1); 
p3 <= (a1 and b1) and (a0 and b0); 

LEDR(0) <= p0; 
LEDR(1) <= p1; 
LEDR(2) <= p2; 
LEDR(3) <= p3; 

end architecture main; 


