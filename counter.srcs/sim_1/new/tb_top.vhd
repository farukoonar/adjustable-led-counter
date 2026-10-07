--------------------------------------------------------------------------------
-- LIBRARY and PACKAGE DECLARATIONS
--------------------------------------------------------------------------------
-- standard package
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--------------------------------------------------------------------------------
-- TESTBENCH ENTITY
--------------------------------------------------------------------------------
entity tb_top is
generic(
c_clkfreq : integer := 20
);
end tb_top;

--------------------------------------------------------------------------------
-- TESTBENCH ARCHITECTURE
--------------------------------------------------------------------------------
architecture Behavioral of tb_top is

----------------------------------------------------------------------------
-- UUT (Unit Under Test) 
----------------------------------------------------------------------------
component top is
generic(
c_clkfreq : integer := 100_000_000
);
port(
clk : in  std_logic;
rst : in  std_logic; 
sw  : in  std_logic_vector(1 downto 0);
led : out std_logic_vector(15 downto 0)
);
end component;

----------------------------------------------------------------------------
-- CONSTANTS
----------------------------------------------------------------------------
-- 100 MHz saat işareti için periyot: 1 / 100 MHz = 10 ns
constant c_clkperiod : time := 10 ns;

----------------------------------------------------------------------------
-- SIGNALS
----------------------------------------------------------------------------
signal clk : std_logic := '0';
signal rst : std_logic := '1';
signal sw  : std_logic_vector(1 downto 0) := (others => '0');

signal led : std_logic_vector(15 downto 0);

----------------------------------------------------------------------------
-- BEGIN
----------------------------------------------------------------------------
begin
----------------------------------------------------------------------------
--  COMPONENT INSTANTIATION
----------------------------------------------------------------------------
uut : top
generic map(
c_clkfreq => c_clkfreq 
)
port map(
clk => clk,
rst => rst,
sw  => sw,
led => led
);

----------------------------------------------------------------------------
-- CLOCK GENERATOR PROCESS
----------------------------------------------------------------------------
clk_process : process
begin

clk <= '0';
wait for c_clkperiod / 2;
clk <= '1';
wait for c_clkperiod / 2;
	
end process;

----------------------------------------------------------------------------
-- STIMULUS PROCESS
----------------------------------------------------------------------------
stim_proc : process
begin
	
wait for 100 ns;

rst <= '0';
sw <= "00";
wait for 1200 ns;
rst <= '1';
wait for 20 ns;

rst <= '0';
sw <= "01";
wait for 600 ns;
rst <= '1';
wait for 20 ns;

rst <= '0';
sw <= "10";
wait for 300 ns;
rst <= '1';
wait for 20 ns;

rst <= '0';
sw <= "11";
wait for 150 ns;

rst <= '1';


assert false
report "SIM DONE"
severity failure;

end process;

end Behavioral;
