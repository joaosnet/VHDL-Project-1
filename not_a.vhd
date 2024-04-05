library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity not_a is
    generic(
        nbits : integer := 4
    );
    port(
        A : in std_logic_vector(nbits-1 downto 0);
        sel : in std_logic_vector(3 downto 0);
        resultado : out std_logic_vector(nbits-1 downto 0)
    );
end not_a;

architecture comportamento of not_a is
    signal nota : std_logic_vector(nbits-1 downto 0);
begin
    nota <= std_logic_vector(not unsigned(A));
    resultado <= nota when sel="0100" else (others => '0');
end comportamento;