library IEEE; -- Biblioteca padrão IEEE para VHDL
use ieee.std_logic_1164.all; -- Importa o pacote std_logic_1164 da biblioteca IEEE

entity sd is -- Declaração da entidade "sd"
	port(
		in_a, in_b, in_c : in std_logic_vector(31 downto 0); -- Portas de entrada in_a, in_b e in_c do tipo std_logic_vector de tamanho 32 bits
		sel_somasub, sel_mux : in std_logic; -- Portas de entrada sel_somasub e sel_mux do tipo std_logic
		resultado : out std_logic_vector(31 downto 0) -- Porta de saída resultado do tipo std_logic_vector de tamanho 32 bits
	);
end sd; -- Fim da declaração da entidade "sd"

architecture comportamento of sd is -- Declaração da arquitetura "comportamento" para a entidade "sd"
	component somasub is -- Declaração do componente "somasub"
	generic(
		nbits : integer := 4 -- Parâmetro genérico nbits com valor padrão 4
	);
	port(
		op_a, op_b : in std_logic_vector(nbits-1 downto 0); -- Portas de entrada op_a e op_b do tipo std_logic_vector de tamanho nbits
		sel : in std_logic; -- Porta de entrada sel do tipo std_logic
		resultado : out std_logic_vector(nbits-1 downto 0) -- Porta de saída resultado do tipo std_logic_vector de tamanho nbits
	);
	end component; -- Fim da declaração do componente "somasub"
	
	component mux is -- Declaração do componente "mux"
	generic(
		nbits : integer := 4 -- Parâmetro genérico nbits com valor padrão 4
	);
	port(
		in_a, in_b : in std_logic_vector(nbits-1 downto 0); -- Portas de entrada in_a e in_b do tipo std_logic_vector de tamanho nbits
		sel : in std_logic; -- Porta de entrada sel do tipo std_logic
		resultado : out std_logic_vector(nbits-1 downto 0) -- Porta de saída resultado do tipo std_logic_vector de tamanho nbits
	);
	end component; -- Fim da declaração do componente "mux"
	
	component shift is -- Declaração do componente "shift"
	generic(
		nbits : integer := 4; -- Parâmetro genérico nbits com valor padrão 4
		shift : integer := 4; -- Parâmetro genérico shift com valor padrão 4
		shift_config : string := "esquerda" -- Parâmetro genérico shift_config do tipo string com valor padrão "esquerda"
	);
	port(
		op_a : in std_logic_vector(nbits-1 downto 0); -- Porta de entrada op_a do tipo std_logic_vector de tamanho nbits
		resultado : out std_logic_vector(nbits-1 downto 0) -- Porta de saída resultado do tipo std_logic_vector de tamanho nbits
	);
	end component; -- Fim da declaração do componente "shift"
	
	constant nbits_config : integer := 32; -- Constante nbits_config do tipo integer com valor 32
	constant nbits_shift : integer := 4; -- Constante nbits_shift do tipo integer com valor 4
	constant shift_config : string := "esquerda"; -- Constante shift_config do tipo string com valor "esquerda"
	
	signal res_somasub : std_logic_vector(nbits_config-1 downto 0); -- Sinal res_somasub do tipo std_logic_vector de tamanho nbits_config
	signal mux_output, and_result : std_logic_vector(nbits_config-1 downto 0); -- Sinais mux_output e and_result do tipo std_logic_vector de tamanho nbits_config
	
begin
	inst_somasub : somasub -- Instanciação do componente "somasub" com o nome "inst_somasub"
	generic map(
		nbits => nbits_config -- Mapeamento do parâmetro genérico nbits para o valor de nbits_config
	)
	port map(
		op_a => in_a, -- Mapeamento da porta de entrada op_a para a porta de entrada in_a
		op_b => in_b, -- Mapeamento da porta de entrada op_b para a porta de entrada in_b
		sel => sel_somasub, -- Mapeamento da porta de entrada sel para a porta de entrada sel_somasub
		resultado => res_somasub -- Mapeamento da porta de saída resultado para o sinal res_somasub
	);
	
	inst_mux : mux -- Instanciação do componente "mux" com o nome "inst_mux"
	generic map(
		nbits => nbits_config -- Mapeamento do parâmetro genérico nbits para o valor de nbits_config
	)
	port map(
		in_a => res_somasub, -- Mapeamento da porta de entrada in_a para o sinal res_somasub
		in_b => in_c, -- Mapeamento da porta de entrada in_b para a porta de entrada in_c
		sel => sel_mux, -- Mapeamento da porta de entrada sel para a porta de entrada sel_mux
		resultado => mux_output -- Mapeamento da porta de saída resultado para o sinal mux_output
	);
	
	and_result <= in_a and mux_output; -- Atribuição da operação AND entre in_a e mux_output ao sinal and_result
	
	inst_shift : shift -- Instanciação do componente "shift" com o nome "inst_shift"
	generic map(
		nbits => nbits_config, -- Mapeamento do parâmetro genérico nbits para o valor de nbits_config
		shift => nbits_shift, -- Mapeamento do parâmetro genérico shift para o valor de nbits_shift
		shift_config => shift_config -- Mapeamento do parâmetro genérico shift_config para o valor de shift_config
	)
	port map(
		op_a => and_result, -- Mapeamento da porta de entrada op_a para o sinal and_result
		resultado => resultado -- Mapeamento da porta de saída resultado para a porta de saída resultado
	);
	
end comportamento; -- Fim da arquitetura "comportamento" para a entidade "sd"