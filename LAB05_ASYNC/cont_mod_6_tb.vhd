library IEEE;  
use IEEE.STD_LOGIC_1164.ALL;  
use IEEE.STD_LOGIC_ARITH.ALL;  
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cont_mod_6_tb is
end entity;

architecture behavior of cont_mod_6_tb is
    component cont_mod_6
        Port(
            clk : in std_logic;
            rst : in std_logic;
            count : out std_logic_vector(3 downto 0)
        );
    end component;
--inputs
    signal clock : std_logic := '0';
    signal reset : std_logic := '0';
    signal count : std_logic_vector(3 downto 0);

    begin
        unity : cont_mod_6 port map(
            clk => clock,
            rst => reset,
            count => count
        );

        process
        begin 
            wait for 5ns;
            clock <= not clock;
        end process;

        process
        begin 
            reset <= '1';
            wait for 70ns;
            reset <= not reset; 
            wait;
        end process;
        
    end architecture;



