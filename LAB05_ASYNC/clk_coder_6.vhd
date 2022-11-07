library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity clk_coder_6 is
    port(
        a : in std_logic_vector(3 downto 0);
        clk : out std_logic
        );
end entity;

architecture behavioral of clk_coder_6 is
begin
    process(a)
        begin
            if(a(2) = '0') then
                clk <= '0';
            else 
                clk <= '1';
            end if;
        end process;
    end behavioral;
