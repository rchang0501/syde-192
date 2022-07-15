library ieee; -- Declare that you want to use IEEE libraries
use ieee.std_logic_1164.all; -- Library for standard logic circuits
use ieee.numeric_std.all; -- Another useful library for UNSIGNED numbers

entity four_bit_adder is -- entity definition
port( SW: in std_logic_vector(9 downto 0); -- Toggle switches
LEDG: out std_logic_vector(7 downto 0) -- Green LEDs
);
end entity four_bit_adder;

architecture main of four_bit_adder is
signal a, b: unsigned(3 downto 0);
signal c: unsigned(4 downto 0);

begin

a <= unsigned(SW(3 downto 0));
b <= unsigned(SW(9 downto 6));
c <= ('0' & a) + ('0' & b); -- addition syntax is here
LEDG(4 downto 0) <= std_logic_vector(c);

end architecture main;
