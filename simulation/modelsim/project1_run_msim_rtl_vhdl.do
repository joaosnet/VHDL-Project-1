transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/joaod/Documents/GitHub/VHDL-Project-1/testbench.vhd}
vcom -93 -work work {C:/Users/joaod/Documents/GitHub/VHDL-Project-1/subtracao.vhd}
vcom -93 -work work {C:/Users/joaod/Documents/GitHub/VHDL-Project-1/soma.vhd}
vcom -93 -work work {C:/Users/joaod/Documents/GitHub/VHDL-Project-1/shiftright.vhd}
vcom -93 -work work {C:/Users/joaod/Documents/GitHub/VHDL-Project-1/shiftleft.vhd}
vcom -93 -work work {C:/Users/joaod/Documents/GitHub/VHDL-Project-1/sd.vhd}
vcom -93 -work work {C:/Users/joaod/Documents/GitHub/VHDL-Project-1/orlogic.vhd}
vcom -93 -work work {C:/Users/joaod/Documents/GitHub/VHDL-Project-1/notb.vhd}
vcom -93 -work work {C:/Users/joaod/Documents/GitHub/VHDL-Project-1/nota.vhd}
vcom -93 -work work {C:/Users/joaod/Documents/GitHub/VHDL-Project-1/nmenosum.vhd}
vcom -93 -work work {C:/Users/joaod/Documents/GitHub/VHDL-Project-1/nmaisum.vhd}
vcom -93 -work work {C:/Users/joaod/Documents/GitHub/VHDL-Project-1/andlogic.vhd}

