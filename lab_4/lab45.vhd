library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lab45 is 
	port( SW: in std_logic_vector(9 downto 0);
			KEY: in std_logic_vector(3 downto 0);
			LEDR: out std_logic_vector(9 downto 0);
			LEDG: out std_logic_vector(7 downto 0);
			CLOCK_50_B5B: in std_logic;
			HEX0, HEX1, HEX2, HEX3: out std_logic_vector(6 downto 0)
	);
end entity; 

architecture RTL of lab45 is
type traffic_states is (nsgf, nsgs, nsa, nsr, ewgf, ewgs, ewa, ewr);
signal state: traffic_states; 
signal state_pos: unsigned(2 downto 0);
signal temp: unsigned(4 downto 0);			
signal clock_10_Hz: std_logic;
signal overall_clock: unsigned(3 downto 0);
signal counter: unsigned(21 downto 0);
signal counter2: unsigned(24 downto 0);
signal counter3: unsigned(3 downto 0);

component seven_segment is 
	port (data_in: in  std_logic_vector(3 downto 0); 
			blanking: in  std_logic;
			segments_out: out std_logic_vector(6 downto 0)
	);
end component; 

begin
	traffic_light: process (CLOCK_50_B5B)

begin
	if rising_edge(CLOCK_50_B5B) then
		if counter = to_unsigned(2499999, 22) then
			counter <= to_unsigned(0, 22);
			clock_10_Hz <= not clock_10_Hz;
			temp <= temp + 1;
			
			if temp = to_unsigned(20, 5) then
				temp <= to_unsigned(0, 5);
				counter3 <= counter3 + 1;
			end if;
		
		else
			counter <= counter + 1;
		end if;

		case state is
			when nsgf => 
				LEDG(7) <= clock_10_Hz;
				LEDR(0) <= '0';
				LEDR(4) <= '1';                                                                                                                                                   
				state_pos <= to_unsigned(0, 3);
				if counter3 = 2 then
					counter3 <= to_unsigned(0, 4);					
					state <= nsgs;
				end if;

			when nsgs =>
				LEDG(7) <= '1';
				LEDR(4) <= '1';
				state_pos <= to_unsigned(1, 3);
				if counter3 = 5 then
					counter3 <= to_unsigned(0, 4);
					state <= nsa;
				end if;

			when nsa =>
				LEDR(0) <= clock_10_Hz;
				LEDG(7) <= '0';
				LEDR(4) <= '1';
				state_pos <= to_unsigned(2, 3);
				if counter3 = 3 then
					counter3 <= to_unsigned(0, 4);
					state <= nsr;
				end if;
				
			when nsr =>
				LEDR(0) <= '1';
				LEDR(4) <= '1';
				state_pos <= to_unsigned(3, 3);
				if counter3 = 1 then
					counter3 <= to_unsigned(0, 4);
					state <= ewgf;
				end if;
				
			when ewgf =>
				LEDR(0) <= '1';
				LEDR(4) <= '0';
				state_pos <= to_unsigned(4, 3);
				LEDG(4) <= clock_10_Hz;
				if counter3 = 2 then
					counter3 <= to_unsigned(0, 4);
					state <= ewgs;
				end if;
				
			when ewgs => 
				LEDR(0) <= '1';
				LEDG(4) <= '1';
				state_pos <= to_unsigned(5, 3);
				if counter3 = 5 then
					counter3 <= to_unsigned(0, 4);
					state <= ewa;
				end if;
				
			when ewa =>
				LEDR(0) <= '1';
				LEDG(4) <= '0';
				LEDR(4) <= clock_10_Hz;
				state_pos <= to_unsigned(6, 3);
				if counter3 = 3 then
					counter3 <= to_unsigned(0, 4);
					state <= ewr;
				end if;
				
			when ewr =>
				LEDR(0) <= '1';
				LEDR(4) <= '1';
				state_pos <= to_unsigned(7, 3);
				if counter3 = 1 then
					counter3 <= to_unsigned(0, 4);
					state <= nsgf;
				end if;
		end case;
	end if;
end process;

hex_component_1: entity work.seven_segment(behavioral) port map('0' & std_logic_vector(state_pos), '0', HEX3);
hex_component_2: entity work.seven_segment(behavioral) port map("0000", '1', HEX2);
hex_component_3: entity work.seven_segment(behavioral) port map("0000", '1', HEX1);
hex_component_4: entity work.seven_segment(behavioral) port map(std_logic_vector(counter3), '0', HEX0);


end architecture;