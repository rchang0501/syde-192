library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all; 

entity q2_two_bit_adder is 
	port(
		KEY: in std_logic_vector(3 downto 0);
		SW: in std_logic_vector(9 downto 0); 
		LEDR: out std_logic_vector(9 downto 0); 
		LEDG: out std_logic_vector(7 downto 0)
	); 
end entity q2_two_bit_adder; 

architecture main of q2_two_bit_adder is 
signal a0, a1, b0, b1, c0, c1, c2: std_logic;  

begin
a0 <= SW(0); 
a1 <= SW(1); 
b0 <= SW(2); 
b1 <= SW(3); 

c0 <= ((not(a1) and not(a0) and not(b1) and b0) or (not(a1) and not(a0) and b1 and b0) or (not(a1) and a0 and not(b1) and not(b0)) or (not(a1) and a0 and b1 and not(b0)) or (a1 and not(a0) and not(b1) and b0) or (a1 and not(a0) and b1 and b0) or (a1 and a0 and not(b1) and not(b0)) or (a1 and a0 and b1 and not(b0)));
c1 <= ((not(a1) and not(a0) and b1 and not(b0)) or (not(a1) and not(a0) and b1 and b0) or (not(a1) and a0 and not(b1) and b0) or (not(a1) and a0 and b1 and not(b0)) or (a1 and not(a0) and not(b1) and not(b0)) or (a1 and not(a0) and not(b1) and b0) or (a1 and a0 and not(b1) and not(b0)) or (a1 and a0 and b1 and b0));
c2 <= ((not(a1) and a0 and b1 and b0) or (a1 and not(a0) and b1 and not(b0)) or (a1 and not(a0) and b1 and b0) or (a1 and a0 and not(b1) and b0) or (a1 and a0 and b1 and not(b0)) or (a1 and a0 and b1 and b0));

LEDR(0) <= c0; 
LEDR(1) <= c1; 
LEDR(2) <= c2; 

end architecture main; 


