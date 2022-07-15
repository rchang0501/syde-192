library ieee;					
use ieee.std_logic_1164.all;	
use ieee.numeric_std.all; 	

entity lab44 is 	
	port( KEY: 		in 	std_logic_vector(3 downto 0); 	
			SW: 		in 	std_logic_vector(9 downto 0); 	
			LEDR:		out 	std_logic_vector(9 downto 0); 	
			LEDG:		out 	std_logic_vector(7 downto 0);
			hex3, hex2, hex1, hex0: out std_logic_vector(6 downto 0)
			); 
end entity lab44; 

architecture main of lab44 is
signal x, y: std_logic_vector(3 downto 0);
signal m: std_logic_vector(7 downto 0);
signal i1, i2, i3, i4, i5, i6: std_logic_vector(3 downto 0);
signal o1, o2, o3: std_logic_vector(3 downto 0);
signal c1, c2, c3: std_logic;

component Four_bits_adder is
port( num1, num2: in std_logic_vector(3 downto 0);
		sum: out std_logic_vector(3 downto 0);
		cout4: out std_logic

);
end component;

component seven_segment is
port(data_in:		in std_logic_vector(3 downto 0);	-- The 4 bit data to be displayed
			blanking:		in std_logic;						-- Blank the output if this is input is set to HIGH
			segments_out: 	out std_logic_vector(6 downto 0) );	-- 7 bits out to a 7-segment display
end component;

begin
x(0) <=SW(0);
x(1) <=SW(1);
x(2) <=SW(2);
x(3) <=SW(3);
y(0) <=SW(4);
y(1) <=SW(5);
y(2) <=SW(6);
y(3) <=SW(7);

i1(3) <= '0';
i1(0) <= x(1) and y(0); 
i1(1) <= x(2) and y(0);
i1(2) <= x(3) and y(0);

i2(0) <= x(0) and y(1);
i2(1) <= x(1) and y(1);
i2(2) <= x(2) and y(1);
i2(3) <= x(3) and y(1);

i4(0) <= x(0) and y(2);
i4(1) <= x(1) and y(2);
i4(2) <= x(2) and y(2);
i4(3) <= x(3) and y(2);

i6(0) <= x(0) and y(3);
i6(1) <= x(1) and y(3);
i6(2) <= x(2) and y(3);
i6(3) <= x(3) and y(3);

component1: entity work.Four_bits_adder(RTL) port map(i1, i2, o1, c1);

i3(0) <= o1(1);
i3(1) <= o1(2);
i3(2) <= o1(3);
i3(3) <= c1;

component2: entity work.Four_bits_adder(RTL) port map(i3, i4, o2, c2);

i5(0) <= o2(1);
i5(1) <= o2(2);
i5(2) <= o2(3);
i5(3) <= c2;

component3: entity work.Four_bits_adder(RTL) port map(i5, i6, o3, c3);

m(0) <= x(0) and y(0);
m(1) <= o1(0);
m(2) <= o2(0);
m(3) <= o3(0);
m(4) <= o3(1);
m(5) <= o3(2);
m(6) <= o3(3);
m(7) <= c3;

hex3_inst: entity work.seven_segment(behavioral) port map(x, '0', hex3);
hex2_inst: entity work.seven_segment(behavioral) port map(y, '0', hex2);
hex1_inst: entity work.seven_segment(behavioral) port map(m(7 downto 4), '0', hex1);
hex0_inst: entity work.seven_segment(behavioral) port map(m(3 downto 0), '0', hex0);

LEDG(7 downto 0) <= m(7 downto 0);

end architecture main;

