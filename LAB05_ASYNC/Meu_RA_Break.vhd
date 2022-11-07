library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity Meu_RA_Break is
    port(
        a,b,c,d,e,f : in std_logic_vector(3 downto 0);
        pause : out std_logic
    );
end entity;

architecture behavioral of Meu_RA_Break is
begin
    process(a,b,c,d,e,f)
    begin
        if(a="0100" and b="1100" and c="1010" and d="1100" and e="0110" and f="0110") then
            pause <= '1';
        else
            pause <= '0';
        end if;
    end process;
end behavioral;