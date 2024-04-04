-- UNIDADE LÓGICA E ARITMÉTICA (ALU) EM VHDL

-- Tabela verde para seleção de operações da ALU

-- sel3 sel2 sel1 sel0  | operação              [A0..A3] [B0..B3]
-- --------------------------------                     _______   ______
--    0    0    0    1  | A + B                         \      \ /     /
--    0    0    1    0  | A - B             [s0..s3]     \      ALU   /
--    0    0    1    1  | A and B                         \__________/
--    0    1    0    0  | A or B
--    0    1    0    1  | not A
--    0    1    1    0  | not b
--    0    1    1    1  | << (shift left)
--    1    0    0    0  | >> (shift right)
--    1    0    0    1  | n + 1
--    1    0    1    0  | n - 1

-- Autor: João da Cruz de Nativiade e Silva Neto
-- Data: 04/04/2024

-- Curso: Engenharia de Computação
-- Disciplina: Projetos de Hardware e Interfaceamento
