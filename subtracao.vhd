-- subtracao.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Subtracao is
    generic(
		nbits : integer := 4 -- Parâmetro genérico nbits com valor padrão 4
	);
    Port ( A : in  STD_LOGIC_VECTOR (nbits-1 downto 0);
           B : in  STD_LOGIC_VECTOR (nbits-1 downto 0);
           sel : in  STD_LOGIC_VECTOR (3 downto 0);
           S : out  STD_LOGIC_VECTOR (nbits-1 downto 0));
end Subtracao;

architecture Behavior of Subtracao is
signal sub : std_logic_vector(nbits-1 downto 0);
begin
    sub <= std_logic_vector(signed(A) - signed(B));
    S <= sub when sel="0001";
end Behavior;