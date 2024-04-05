-- NmenosUm.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity NmenosUm is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           Resultado : out  STD_LOGIC_VECTOR (31 downto 0));
end NmenosUm;

architecture Behavior of NmenosUm is
begin
    Resultado <= std_logic_vector(unsigned(A) - unsigned(1));
end Behavior;