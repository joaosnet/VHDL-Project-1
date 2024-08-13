-- and_logic.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity andlogic is
	generic(
		nbits : integer := 4 -- Parâmetro genérico nbits com valor padrão 4
	);
    Port ( A : in  STD_LOGIC_VECTOR (nbits-1 downto 0);
           B : in  STD_LOGIC_VECTOR (nbits-1 downto 0);
           S : out  STD_LOGIC_VECTOR (nbits-1 downto 0));
end andlogic;

architecture Behavior of andlogic is
    signal and_gate : STD_LOGIC_VECTOR (nbits-1 downto 0);
begin
    and_gate <= A and B;
    S <= and_gate;
end Behavior;