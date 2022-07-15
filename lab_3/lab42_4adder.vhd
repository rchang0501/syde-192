library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lab42_4adder is
port(
		KEY: 		in 	std_logic_vector(3 downto 0); 	-- Push buttons 
			SW: 		in 	std_logic_vector(9 downto 0); 	-- Toggle switches 
			LEDR:		out 	std_logic_vector(9 downto 0); 	-- Red LEDs 
			LEDG:		out 	std_logic_vector(7 downto 0)		-- Green LEDs 

);

end entity lab42_4adder;

architecture main of lab42_4adder is
signal x0, y0, x1, y1, x2, y2, x3, y3: std_logic;
signal c1, c2, c3, s0, s1, s2, s3, s4: std_logic; -- c4 is s4

component Full_adder is
port(x, y, cin: in std_logic;
		s, cout:	out std_logic);
end component;

begin
x0 <=SW(0);
x1 <=SW(1);
x2 <=SW(2);
x3 <=SW(3);
y0 <=SW(4);
y1 <=SW(5);
y2 <=SW(6);
y3 <=SW(7);

component1: entity work.Full_adder(RTL) port map(x0, y0, '0', s0, c1);
component2: entity work.Full_adder(RTL) port map(x1, y1, c1, s1, c2);
component3: entity work.Full_adder(RTL) port map(x2, y2, c2, s2, c3);
component4: entity work.Full_adder(RTL) port map(x3, y3, c3, s3, s4);

LEDG(4) <=s4;
LEDG(3) <=s3;
LEDG(2) <=s2;
LEDG(1) <=s1;
LEDG(0) <=s0;

end architecture;