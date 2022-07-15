library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lab44 is 
	port(
		KEY: in std_logic_vector(3 downto 0); 
		SW: in std_logic_vector(9 downto 0); 
		LEDR: out std_logic_vector(9 downto 0); 
		LEDG: out std_logic_vector(7 downto 0); 
		CLOCK_50_B5B: in std_logic; 
		HEX0, HEX1, HEX2, HEX3: out std_logic_vector(6 downto 0) 
	); 
end entity lab44; 

architecture main of lab44 is 
signal counter: unsigned(24 downto 0); 
signal clock_1_hz: std_logic; 
signal rndm: unsigned(7 downto 0); 
signal blanking, blanking2: std_logic:= '1'; 
signal one, two, three, four : std_logic_vector(3 downto 0); 
signal segment0, segment1, segment2, segment3: std_logic_vector(6 downto 0); 

component seven_segment is 
	port (data_in: in std_logic_vector(3 downto 0);
			blanking: in std_logic; 
			segments_out: out std_logic_vector(6 downto 0)
	); 
end component; 

begin 
	rndm <= rndm + 1 when rising_edge(CLOCK_50_B5B);
	one <= std_logic_vector(rndm(3 downto 0)) when rising_edge(KEY(0)); 
	two <= std_logic_vector(rndm(7 downto 4)) when rising_edge(KEY(0)); 
	three <= one when rising_edge(KEY(0)); 
	four <= two when rising_edge(KEY(0)); 
	
	blanking <= '0' when rising_edge(KEY(0));
	blanking2 <= '0' when rising_edge(KEY(0)) and blanking = '0';
	
	display1: entity work.seven_segment(behavioral) port map(one, blanking, segment0); 
	display2: entity work.seven_segment(behavioral) port map(two, blanking, segment1); 
	display3: entity work.seven_segment(behavioral) port map(three, blanking2, segment2); 
	display4: entity work.seven_segment(behavioral) port map(four, blanking2, segment3); 

	HEX0 <= segment0; 
	HEX1 <= segment1;
	HEX2 <= segment2;
	HEX3 <= segment3;
	
end architecture main; 