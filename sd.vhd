-- FILEPATH: /C:/Users/joaod/Documents/GitHub/VHDL-Project-1/sd.vhd

-- Descrição: Este arquivo VHDL implementa um componente chamado "sd" que realiza uma seleção de operações.
-- O componente possui três entradas de dados (in_a, in_b, in_c) e duas entradas de seleção (sel_somasub, sel_mux).
-- A saída do componente é o resultado da operação selecionada (resultado).

library IEEE;
use ieee.std_logic_1164.all;

entity sd is
	port(
		in_a, in_b, in_c : in std_logic_vector(31 downto 0); -- Entradas de dados
		sel_somasub, sel_mux : in std_logic; -- Entradas de seleção
		resultado : out std_logic_vector(31 downto 0) -- Saída do resultado
	);
end sd;

architecture comportamento of sd is
	component somasub is
	generic(
		nbits : integer := 4 -- Número de bits para as operações de soma/subtração
	);
	port(
		op_a, op_b : in std_logic_vector(nbits-1 downto 0); -- Operandos para a operação de soma/subtração
		sel : in std_logic; -- Seleção da operação (soma ou subtração)
		resultado : out std_logic_vector(nbits-1 downto 0) -- Resultado da operação de soma/subtração
	);
	end component;
	
	component mux is
	generic(
		nbits : integer := 4 -- Número de bits para a operação de multiplexação
	);
	port(
		in_a, in_b : in std_logic_vector(nbits-1 downto 0); -- Entradas para a operação de multiplexação
		sel : in std_logic; -- Seleção da entrada (in_a ou in_b)
		resultado : out std_logic_vector(nbits-1 downto 0) -- Resultado da operação de multiplexação
	);
	end component;
	
	component shift is
	generic(
		nbits : integer := 4; -- Número de bits para a operação de deslocamento
		shift : integer := 4; -- Quantidade de bits para deslocar
		shift_config : string := "esquerda" -- Configuração do deslocamento (esquerda ou direita)
	);
	port(
		op_a : in std_logic_vector(nbits-1 downto 0); -- Operando para a operação de deslocamento
		resultado : out std_logic_vector(nbits-1 downto 0) -- Resultado da operação de deslocamento
	);
	end component;
	
	constant nbits_config : integer := 32; -- Número de bits para a configuração
	constant nbits_shift : integer := 4; -- Quantidade de bits para deslocar
	constant shift_config : string := "esquerda"; -- Configuração do deslocamento (esquerda ou direita)
	
	signal res_somasub : std_logic_vector(nbits_config-1 downto 0); -- Sinal para armazenar o resultado da operação de soma/subtração
	signal mux_output, and_result : std_logic_vector(nbits_config-1 downto 0); -- Sinais para armazenar o resultado da operação de multiplexação e operação AND
	
begin
	inst_somasub : somasub
	generic map(
		nbits => nbits_config -- Configuração do número de bits para a operação de soma/subtração
	)
	port map(
		op_a => in_a, -- Operando A para a operação de soma/subtração
		op_b => in_b, -- Operando B para a operação de soma/subtração
		sel => sel_somasub, -- Seleção da operação (soma ou subtração)
		resultado => res_somasub -- Resultado da operação de soma/subtração
	);
	
	inst_mux : mux
	generic map(
		nbits => nbits_config -- Configuração do número de bits para a operação de multiplexação
	)
	port map(
		in_a => res_somasub, -- Entrada A para a operação de multiplexação
		in_b => in_c, -- Entrada B para a operação de multiplexação
		sel => sel_mux, -- Seleção da entrada (in_a ou in_b)
		resultado => mux_output -- Resultado da operação de multiplexação
	);
	
	and_result <= in_a and mux_output; -- Operação AND entre in_a e o resultado da operação de multiplexação
	
	inst_shift : shift
	generic map(
		nbits => nbits_config, -- Configuração do número de bits para a operação de deslocamento
		shift => nbits_shift, -- Quantidade de bits para deslocar
		shift_config => shift_config -- Configuração do deslocamento (esquerda ou direita)
	)
	port map(
		op_a => and_result, -- Operando para a operação de deslocamento
		resultado => resultado -- Resultado da operação de deslocamento
	);
	
end comportamento;
library IEEE;
use ieee.std_logic_1164.all;

entity sd is
	port(
		in_a, in_b, in_c : in std_logic_vector(31 downto 0);
		sel_somasub, sel_mux : in std_logic;
		resultado : out std_logic_vector(31 downto 0)
	);
end sd;

architecture comportamento of sd is
	component somasub is
	generic(
		nbits : integer := 4
	);
	port(
		op_a, op_b : in std_logic_vector(nbits-1 downto 0);
		sel : in std_logic;
		resultado : out std_logic_vector(nbits-1 downto 0)
	);
	end component;
	
	component mux is
	generic(
		nbits : integer := 4
	);
	port(
		in_a, in_b : in std_logic_vector(nbits-1 downto 0);
		sel : in std_logic;
		resultado : out std_logic_vector(nbits-1 downto 0)
	);
	end component;
	
	component shift is
	generic(
		nbits : integer := 4;
		shift : integer := 4;
		shift_config : string := "esquerda" --"esquerda" ou "direita"
	);
	port(
		op_a : in std_logic_vector(nbits-1 downto 0);
		resultado : out std_logic_vector(nbits-1 downto 0)
	);
	end component;
	
	constant nbits_config : integer := 32;
	constant nbits_shift : integer := 4;
	constant shift_config : string := "esquerda";
	
	signal res_somasub : std_logic_vector(nbits_config-1 downto 0);
	signal mux_output, and_result : std_logic_vector(nbits_config-1 downto 0);
	
begin
	inst_somasub : somasub
	generic map(
		nbits => nbits_config
	)
	port map(
		op_a => in_a,
		op_b => in_b,
		sel => sel_somasub,
		resultado => res_somasub
	);
	
	inst_mux : mux
	generic map(
		nbits => nbits_config
	)
	port map(
		in_a => res_somasub,
		in_b => in_c,
		sel => sel_mux,
		resultado => mux_output
	);
	
	and_result <= in_a and mux_output;
	
	inst_shift : shift
	generic map(
		nbits => nbits_config,
		shift => nbits_shift,
		shift_config => shift_config
	)
	port map(
		op_a => and_result,
		resultado => resultado
	);
	
end comportamento;