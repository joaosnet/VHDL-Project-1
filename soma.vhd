-- soma.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Soma is
    generic(
		nbits : integer := 4 -- Parâmetro genérico nbits com valor padrão 4
	);
    Port ( A : in  STD_LOGIC_VECTOR (nbits-1 downto 0);
           B : in  STD_LOGIC_VECTOR (nbits-1 downto 0);
           S : out  STD_LOGIC_VECTOR (nbits-1 downto 0));
end Soma;

architecture Behavior of Soma is
    signal soma : std_logic_vector(nbits-1 downto 0);
begin
    soma <= std_logic_vector(unsigned(A) + unsigned(B));
    S <= soma;
end Behavior;