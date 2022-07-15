library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hex_output is
	port(
		KEY: 		    in std_logic_vector(3 downto 0); 	-- Push buttons 
		SW: 		    in std_logic_vector(9 downto 0); 	-- Toggle switches 
		LEDR:		   out std_logic_vector(9 downto 0); 	-- Red LEDs 
		LEDG:		   out std_logic_vector(7 downto 0);		-- Green LEDs 
		HEX0, HEX1: out std_logic_vector(6 downto 0);
		HEX2, HEX3: out std_logic_vector(6 downto 0));

end entity hex_output;

architecture RTL of hex_output is
signal x, y: std_logic_vector(3 downto 0); 
signal s: std_logic_vector(4 downto 0); 
signal c1, c2, c3, c4: std_logic; 

component Full_adder is
port(x, y, cin: in std_logic;
		s, cout:	out std_logic);
end component;

component seven_segment is 
	port(data_in: in std_logic_vector(3 downto 0);
		  blanking: in std_logic;
		  segments_out: out std_logic_vector(6 downto 0)); 
end component; 

begin
x <= SW(3 downto 0); 
y <= SW(7 downto 4); 

LEDG(4 downto 0) <= s; 

component1: entity work.Full_adder(RTL) port map(x(0), y(0), '0', s(0), c1);
component2: entity work.Full_adder(RTL) port map(x(1), y(1), c1, s(1), c2);
component3: entity work.Full_adder(RTL) port map(x(2), y(2), c2, s(2), c3);
component4: entity work.Full_adder(RTL) port map(x(3), y(3), c3, s(3), s(4));

hex_component1: entity work.seven_segment(behavioral) port map(y, '0', HEX3); 
hex_component2: entity work.seven_segment(behavioral) port map(x, '0', HEX2); 
hex_component3: entity work.seven_segment(behavioral) port map(("000" & s(4)), '0', HEX1); 
hex_component4: entity work.seven_segment(behavioral) port map(s(3 downto 0), '0', HEX0); 

end architecture;