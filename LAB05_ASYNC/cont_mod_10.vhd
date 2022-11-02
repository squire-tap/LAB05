library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity cont_mod_10 is
	port(
		clk,rst : in  std_logic;
		count : inout std_logic_vector(3 downto 0)
		);
end entity;

architecture behavioral of cont_mod_10 is 
begin
	process(clk,rst)
		constant modulo : std_logic_vector := "1010";
	begin
		if(rst = '1' or count = modulo) then
			count <= "0000";
		elsif rising_edge(clk) then
			count <= count + 1;
		end if;
	end process;
end behavioral;	
		

