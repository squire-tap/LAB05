library IEEE;  
use IEEE.STD_LOGIC_1164.ALL;  
use IEEE.STD_LOGIC_ARITH.ALL;  
use IEEE.STD_LOGIC_UNSIGNED.ALL;  

entity cont_mod_10 is  
    Port ( clk : in std_logic;  
           rst : in std_logic;  
           count : out std_logic_vector(3 downto 0)  
    );  
end cont_mod_10;
  
architecture rtl of cont_mod_10 is  
COMPONENT meu_jkff  
    PORT( clock : in std_logic;  
          reset : in std_logic;  
          j     : in std_logic;  
          k     : in std_logic;  
          q     : out std_logic      
    );  
   END COMPONENT;
  
signal temp : std_logic_vector(3 downto 0) := "0000";  
signal reset : std_logic := '0';

begin  
d0 : meu_jkff  
     port map (  
       reset  => rst or reset,  
       clock  => clk,  --clock chega no ff menos significativo
       j      => '1',  
       k      => '1',        
       q      => temp(3)  
    );  

d1 : meu_jkff  
     port map (  
       reset  => rst or reset,  
       clock  => temp(3),  --clock do ff anterior
       j      => '1',  
       k      => '1',      
       q      => temp(2)  
    );  

d2 : meu_jkff  
     port map (  
       reset  => rst or reset,  
       clock  => temp(2),  --clock do ff anterior
       j      => '1',  
       k      => '1',  
       q      => temp(1)  
    );  

d3 : meu_jkff  
     port map (  
       reset  => rst or reset,  
       clock  => temp(1),  --clock do ff anterior
       j      => '1',  
       k      => '1',  
       q      => temp(0)  
    );  

--Reseta quando a saida dos ff's chega em 10
reset <= '1' when (temp(0) = '1' and temp(1) = '1' and temp(2) = '0' and temp(3) = '0')
    else '0';

count(3) <= temp(0);  
count(2) <= temp(1);  
count(1) <= temp(2);  
count(0) <= temp(3);  

 end rtl;  