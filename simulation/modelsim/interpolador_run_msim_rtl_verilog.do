transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Guilherme/Desktop/UFJF/Laborat贸rio\ de\ Sistemas\ Eletr么nicos\ III/interpolador {C:/Users/Guilherme/Desktop/UFJF/Laborat髍io de Sistemas Eletr鬾icos III/interpolador/zero_cross.v}
vlog -vlog01compat -work work +incdir+C:/Users/Guilherme/Desktop/UFJF/Laborat贸rio\ de\ Sistemas\ Eletr么nicos\ III/interpolador {C:/Users/Guilherme/Desktop/UFJF/Laborat髍io de Sistemas Eletr鬾icos III/interpolador/top_level.v}

vlog -vlog01compat -work work +incdir+C:/Users/Guilherme/Desktop/UFJF/Laborat贸rio\ de\ Sistemas\ Eletr么nicos\ III/interpolador {C:/Users/Guilherme/Desktop/UFJF/Laborat髍io de Sistemas Eletr鬾icos III/interpolador/exemplo1_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiv_hssi_ver -L cycloneiv_pcie_hip_ver -L cycloneiv_ver -L rtl_work -L work -voptargs="+acc"  exemplo1_tb

add wave *
view structure
view signals
run 1000 us
