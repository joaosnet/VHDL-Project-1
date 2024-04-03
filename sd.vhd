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