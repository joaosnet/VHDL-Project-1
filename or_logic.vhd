-- or.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Or_Logic is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Resultado : out  STD_LOGIC_VECTOR (31 downto 0));
end Or_Logic;

architecture Behavior of Or_Logic is
begin
    Resultado <= A or B;
end Behavior;