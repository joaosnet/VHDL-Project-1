-- NmaisUm.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity NmaisUm is
	generic(
		nbits : integer := 4 -- Parâmetro genérico nbits com valor padrão 4
	);
    Port ( A : in  STD_LOGIC_VECTOR (nbits-1 downto 0);
           sel : in  STD_LOGIC_VECTOR (3 downto 0);
           S : out  STD_LOGIC_VECTOR (nbits-1 downto 0));
end NmaisUm;

architecture Behavior of NmaisUm is
    signal nmaisum : std_logic_vector(nbits-1 downto 0);
begin
    nmaisum <= std_logic_vector(unsigned(A) + 1);
    S <= nmaisum when sel="1000" else (others => '0');
end Behavior;