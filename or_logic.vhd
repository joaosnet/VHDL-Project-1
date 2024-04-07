-- or.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Or_Logic is
	generic(
		nbits : integer := 4 -- Parâmetro genérico nbits com valor padrão 4
	);
    Port ( A : in  STD_LOGIC_VECTOR (nbits-1 downto 0);
           B : in  STD_LOGIC_VECTOR (nbits-1 downto 0);
           sel : in  STD_LOGIC_VECTOR (3 downto 0);
           S : out  STD_LOGIC_VECTOR (nbits-1 downto 0));
end Or_Logic;

architecture Behavior of Or_Logic is
signal or_gate : STD_LOGIC_VECTOR (nbits-1 downto 0);
begin
    or_gate <= A or B;
    S <= or_gate when sel="0011";
end Behavior;