library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity decoder_4 is
    port(
        co : in std_logic_vector(3 downto 0);
        a,b,c,d : out std_logic
    );
end entity;

architecture behavioral of decoder_4 is
begin 
    process(co)
    begin 
        a <= co(3);
        b <= co(2);
        c <= co(1);
        d <= co(0);
    end process;
end behavioral;