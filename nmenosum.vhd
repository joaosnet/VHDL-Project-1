-- NmenosUm.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity NmenosUm is
	generic(
		nbits : integer := 4 -- Parâmetro genérico nbits com valor padrão 4
	);
    Port ( A : in  STD_LOGIC_VECTOR (nbits-1 downto 0);
           S : out  STD_LOGIC_VECTOR (nbits-1 downto 0));
end NmenosUm;

architecture Behavior of NmenosUm is
signal nmenosum : STD_LOGIC_VECTOR (nbits-1 downto 0);
begin
    nmenosum <= std_logic_vector(unsigned(A) - 1);
    S <= nmenosum;
end Behavior;