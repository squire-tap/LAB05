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
       clock  => not clk,  --clock da placa chega no ff menos significativo
       j      => '1',  
       k      => '1',        
       q      => temp(0)  
    );  

d1 : meu_jkff  
     port map (  
       reset  => rst or reset,  
       clock  => not temp(0),  --clock do ff anterior
       j      => '1',  
       k      => '1',      
       q      => temp(1)  
    );  

d2 : meu_jkff  
     port map (  
       reset  => rst or reset,  
       clock  => not temp(1),  --clock do ff anterior
       j      => '1',  
       k      => '1',  
       q      => temp(2)  
    );  

d3 : meu_jkff  
     port map (  
       reset  => rst or reset,  
       clock  => not temp(2),  --clock do ff anterior
       j      => '1',  
       k      => '1',  
       q      => temp(3)  
    );  

--Reseta quando a saida dos ff's chega em 10
reset <= (not temp(0)) and (temp(1)) and (not temp(2)) and temp(3);

count(3) <= temp(3);  
count(2) <= temp(2);  
count(1) <= temp(1);  
count(0) <= temp(0);  

 end rtl;  