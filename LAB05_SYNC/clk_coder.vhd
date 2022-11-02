library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity clk_coder is
    port(
        a : in std_logic_vector(3 downto 0);
        clk : out std_logic
        );
end entity;

architecture behavioral of clk_coder is
begin
    process(a)
        begin
            if(a = "0000") then
                clk <= '1';
            else 
                clk <= '0';
            end if;
        end process;
    end behavioral;
