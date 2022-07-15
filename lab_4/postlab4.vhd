library ieee;					-- Declare that you want to use IEEE libraries 
use ieee.std_logic_1164.all;	-- Library for standard logic circuits 
use ieee.numeric_std.all; 	-- Another useful library for UNSIGNED numbers 
entity postlab4 is 	-- entity definition 
	port( KEY: 		in 	std_logic_vector(3 downto 0); 	-- Push buttons 
			SW: 		in 	std_logic_vector(9 downto 0); 	-- Toggle switches 
			LEDR:		out 	std_logic_vector(9 downto 0); 	-- Red LEDs 
			LEDG:		out 	std_logic_vector(7 downto 0);		-- Green LEDs 
			HEX0, HEX1, HEX2, HEX3: out std_logic_vector(6 downto 0);
			CLOCK_50_B5B: in std_logic
			); 
end entity postlab4;

architecture main of postlab4 is
signal counter, millisec_counter: unsigned(15 downto 0); ---taking a 1000 Hz counter as it gives us millisecond range

component seven_segment is 
	port (data_in: 	  in  std_logic_vector(3 downto 0); 
			blanking: 	  in  std_logic;
			segments_out: out std_logic_vector(6 downto 0));
end component; 

begin
counting: process (CLOCK_50_B5B, KEY(2))
begin
	if rising_edge(CLOCK_50_B5B) then
		if((KEY(0) ='0' and KEY(1) = '1') or (KEY(0) ='1' and KEY(1) = '0')) then
			counter <= counter + 1;
			if counter = to_unsigned(49999, 16) then
				millisec_counter <= millisec_counter + 1;
				counter <= to_unsigned(0, 16);
			end if;
		end if;
		if (KEY(2) = '0') then
					counter <= to_unsigned(0, 16);
					millisec_counter <= to_unsigned(0, 16);
		end if;
	end if;
	
LEDG(7 downto 0) <= std_logic_vector(millisec_counter(7 downto 0));
		 
end process counting;

hex_component_1: entity work.seven_segment(behavioral) port map(std_logic_vector(millisec_counter(15 downto 12)), '0', HEX3);
hex_component_2: entity work.seven_segment(behavioral) port map(std_logic_vector(millisec_counter(11 downto 8)), '0', HEX2);
hex_component_3: entity work.seven_segment(behavioral) port map(std_logic_vector(millisec_counter(7 downto 4)), '0', HEX1);
hex_component_4: entity work.seven_segment(behavioral) port map(std_logic_vector(millisec_counter(3 downto 0)), '0', HEX0);


end architecture; 
