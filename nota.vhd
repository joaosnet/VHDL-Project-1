-- nota.vhd
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity nota is
    generic(
        nbits : integer := 4
    );
    port(
        A : in std_logic_vector(nbits-1 downto 0);
        S : out std_logic_vector(nbits-1 downto 0)
    );
end nota;

architecture comportamento of nota is
    signal nota1 : std_logic_vector(nbits-1 downto 0);
begin
    nota1 <= std_logic_vector(not unsigned(A));
    S <= nota1;
end comportamento;