-- orlogic.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity orlogic is
	generic(
		nbits : integer := 4 -- Parâmetro genérico nbits com valor padrão 4
	);
    Port ( A : in  STD_LOGIC_VECTOR (nbits-1 downto 0);
           B : in  STD_LOGIC_VECTOR (nbits-1 downto 0);
           S : out  STD_LOGIC_VECTOR (nbits-1 downto 0));
end orlogic;

architecture Behavior of orlogic is
signal or_gate : STD_LOGIC_VECTOR (nbits-1 downto 0);
begin
    or_gate <= A or B;
    S <= or_gate;
end Behavior;