LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity bin_7seg is
	port
	(
		A: in std_logic;
		B: in std_logic;
		C: in std_logic;
		D: in std_logic;
		
		sa: out std_logic;
		sb: out std_logic;
		sc: out std_logic;
		sd: out std_logic;
		se: out std_logic;
		sf: out std_logic;
		sg: out std_logic
	);
end bin_7seg;

architecture decodificador of bin_7seg is
	begin
		sa <= (NOT A AND B AND NOT C AND NOT D) OR (A AND B AND NOT C AND D) OR (NOT A AND NOT B AND NOT C AND D) OR (A AND NOT B AND C AND D);
		sb <= (NOT A AND B AND NOT C AND D) OR (A AND C AND D) OR (B AND C AND NOT D) OR (A AND B AND NOT D);
		sc <= (NOT A AND NOT B AND C AND NOT D) OR (A AND B AND C) OR (A AND B AND NOT D);
		sd <= (NOT A AND B AND NOT C AND NOT D) OR (NOT A AND NOT B AND NOT C AND D) OR (A AND NOT B AND C AND NOT D) OR (B AND C AND D);
		se <= (NOT A AND B AND NOT C) OR (NOT B AND NOT C AND D) OR (NOT A AND C AND D);
		sf <= (A AND B AND NOT C AND D) OR (NOT A AND NOT B AND D) OR (NOT A AND C AND D) OR (NOT A AND NOT B AND C);
		sg <= (A AND B AND NOT C AND NOT D) OR (NOT A AND B AND C AND D) OR (NOT A AND NOT B AND NOT C);
	end architecture decodificador;
	