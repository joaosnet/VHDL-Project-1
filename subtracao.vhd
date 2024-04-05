-- subtracao.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Subtracao is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Resultado : out  STD_LOGIC_VECTOR (31 downto 0));
end Subtracao;

architecture Behavior of Subtracao is
begin
    Resultado <= std_logic_vector(unsigned(A) - unsigned(B));
end Behavior;