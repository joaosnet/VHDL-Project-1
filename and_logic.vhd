-- and_logic.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity And_Logic is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Resultado : out  STD_LOGIC_VECTOR (31 downto 0));
end And_Logic;

architecture Behavior of And_Logic is
begin
    Resultado <= A and B;
end Behavior;