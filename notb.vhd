--notb.vhd
library IEEE; -- Biblioteca padrão IEEE para VHDL
use ieee.std_logic_1164.all; -- Pacote que define o tipo de dados std_logic e operações relacionadas
use ieee.numeric_std.all; -- Pacote que define o tipo de dados unsigned e operações relacionadas

entity notb is -- Declaração da entidade notb
	generic(
		nbits : integer := 4 -- Parâmetro genérico que define o número de bits
	);
	port(
		B : in std_logic_vector(nbits-1 downto 0); -- Portas de entrada op_a e B do tipo std_logic_vector
		sel : in std_logic_vector(3 downto 0); -- Porta de entrada sel do tipo std_logic_vector
		S : out std_logic_vector(nbits-1 downto 0) -- Porta de saída S do tipo std_logic_vector
	);
end notb;

architecture comportamento of notb is -- Declaração da arquitetura comportamento para a entidade notb
	signal notb1 : std_logic_vector(nbits-1 downto 0); -- Declaração dos sinais notb e sub do tipo std_logic_vector
begin
	notb1 <= std_logic_vector(not unsigned(B)); -- notb dos valores de op_a e B convertidos para unsigned e depois convertidos para std_logic_vector
	S <= notb1 when sel="0101" else (others => '0'); -- Atribuição do valor de notb para S quando sel é '0110', caso contrário, atribui o valor de sub para S
end comportamento;