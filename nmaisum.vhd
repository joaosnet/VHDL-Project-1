-- NmaisUm.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity NmaisUm is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           Resultado : out  STD_LOGIC_VECTOR (31 downto 0));
end NmaisUm;

architecture Behavior of NmaisUm is
begin
    Resultado <= std_logic_vector(unsigned(A) + unsigned(1));
end Behavior;