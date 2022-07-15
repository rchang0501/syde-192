library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Four_bits_adder is
port(
		num1,num2: in std_logic_vector(3 downto 0);
		sum: out std_logic_vector(3 downto 0);
		cout4: out std_logic

);

end entity Four_bits_adder;

architecture RTL of Four_bits_adder is
signal x0, y0, x1, y1, x2, y2, x3, y3: std_logic;
signal c1, c2, c3, s0, s1, s2, s3, s4: std_logic; -- c4 is s4

component Full_adder is
port(x, y, cin: in std_logic;
		s, cout:	out std_logic);
end component;

begin
x0 <=num1(0);
x1 <=num1(1);
x2 <=num1(2);
x3 <=num1(3);
y0 <=num2(0);
y1 <=num2(1);
y2 <=num2(2);
y3 <=num2(3);

component1: entity work.Full_adder(RTL) port map(x0, y0, '0', s0, c1);
component2: entity work.Full_adder(RTL) port map(x1, y1, c1, s1, c2);
component3: entity work.Full_adder(RTL) port map(x2, y2, c2, s2, c3);
component4: entity work.Full_adder(RTL) port map(x3, y3, c3, s3, s4);

cout4 <=s4;
sum(3) <=s3;
sum(2) <=s2;
sum(1) <=s1;
sum(0) <=s0;

end architecture;