--------------------------------------------------------------------------------
-- LIBRARY and PACKAGE DECLARATIONS
--------------------------------------------------------------------------------
-- standard package
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
-- user defined package


--------------------------------------------------------------------------------
-- ENTITY
--------------------------------------------------------------------------------
entity top is
generic(
c_clkfreq 	: integer 	:= 100_000_000
);
port(
clk 		: in std_logic;
sw  		: in std_logic_vector(1 downto 0);
rst			: in std_logic;
led 		: out std_logic_vector(15 downto 0)
);
end top;

--------------------------------------------------------------------------------
-- ARCHITECTURE
--------------------------------------------------------------------------------
architecture Behavioral of top is

--------------------------------------------------------------------------------
-- CONSTANTS
--------------------------------------------------------------------------------
constant c_timer2seclim     : integer := c_clkfreq*2;
constant c_timer1seclim     : integer := c_clkfreq;
constant c_timer500mseclim  : integer := c_clkfreq/2;
constant c_timer250mseclim  : integer := c_clkfreq/4;

--------------------------------------------------------------------------------
-- COMPONENT DECLARATIONS
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
-- TYPES
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
-- SIGNALS
--------------------------------------------------------------------------------
signal timer        : integer range 0 to c_timer2seclim := 0;
signal timerlim     : integer range 0 to c_timer2seclim := 0;
signal counter  	: std_logic_vector (15 downto 0) 	:= (others=>'0');

--------------------------------------------------------------------------------
-- BEGIN
--------------------------------------------------------------------------------	
begin

--------------------------------------------------------------------------------
-- COMPONENT INSTANTIATIONS
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
-- CONCURRENT STATEMENTS
--------------------------------------------------------------------------------
timerlim 	<= c_timer2seclim 		when sw = "00" else
				c_timer1seclim 		when sw = "01" else
				c_timer500mseclim 	when sw = "10" else
				c_timer250mseclim;

led 		<= counter;

--------------------------------------------------------------------------------
-- PROCESS STATEMENTS 
-- NOTE: Process blocks work concurrently with each other
--------------------------------------------------------------------------------
-- COMBINATIONAL PROCESS


-- SEQUENTIAL PROCESS
process(clk) begin
if(rising_edge(clk)) then
	if(rst = '1') then
		timer 	<= 0;
		counter <= (others => '0');
	else
		if (timer >= timerlim-1) then
			-- led <= led + 1;  'out' modundaki port geri okunamaz (read error)
			counter <= counter + 1;
			timer 	<= 0;
		else
			timer 	<= timer + 1;
		end if;
	end if;
end if;
end process;

end Behavioral;
