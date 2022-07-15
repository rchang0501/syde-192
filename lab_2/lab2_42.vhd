library ieee;
use ieee.std_logic_1164.all;
-- use ieee.numeric_std.all;

entity lab2_42 is
	port( 
			KEY: in std_logic_vector(3 downto 0);
			SW: in std_logic_vector(9 downto 0);
			LEDR: out std_logic_vector(9 downto 0);
			LEDG: out std_logic_vector(7 downto 0)
			);
end entity lab2_42;

architecture main of lab2_42 is 
signal a0, a1, b0, b1: 	std_logic; --naming inputs
signal p0: 		std_logic; -- p0 
signal p1: 		std_logic; -- p1
signal p2:		std_logic; -- p2
signal p3:		std_logic; -- p3


begin
a0<= SW(0);
a1<= SW(1);
b0<= SW(2);
b1<= SW(3);

p0 <= a0 and b0;
p3 <= (a1 and b1) and (a0 and b0);
p2 <= not (a0 and b0) and (a1 and b1);
p1 <= ((a0 and b1) and not (b0 and a1)) or (not (a0 and b1) and (b0 and a1));

LEDR(0) <= p0;
LEDR(1) <= p1;
LEDR(2) <= p2;
LEDR(3) <= p3;

end architecture main;
