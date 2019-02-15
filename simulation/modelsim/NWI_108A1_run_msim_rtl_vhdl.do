transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Adam-Martin/Documents/Intel/QuartusPrime/NWI_108A1/NWI_108A1.vhd}
vcom -93 -work work {C:/Users/Adam-Martin/Documents/Intel/QuartusPrime/NWI_108A1/INSTRUCTS.vhd}
vcom -93 -work work {C:/Users/Adam-Martin/Documents/Intel/QuartusPrime/NWI_108A1/TIMER.vhd}
vcom -93 -work work {C:/Users/Adam-Martin/Documents/Intel/QuartusPrime/NWI_108A1/UART.vhd}
vcom -93 -work work {C:/Users/Adam-Martin/Documents/Intel/QuartusPrime/NWI_108A1/BUS_MASTER.vhd}
vcom -93 -work work {C:/Users/Adam-Martin/Documents/Intel/QuartusPrime/NWI_108A1/ROM.vhd}
vcom -93 -work work {C:/Users/Adam-Martin/Documents/Intel/QuartusPrime/NWI_108A1/RAM.vhd}
vcom -93 -work work {C:/Users/Adam-Martin/Documents/Intel/QuartusPrime/NWI_108A1/BUS_SLAVE.vhd}
vcom -93 -work work {C:/Users/Adam-Martin/Documents/Intel/QuartusPrime/NWI_108A1/IO_PORT.vhd}
vcom -93 -work work {C:/Users/Adam-Martin/Documents/Intel/QuartusPrime/NWI_108A1/ALU.vhd}
vcom -93 -work work {C:/Users/Adam-Martin/Documents/Intel/QuartusPrime/NWI_108A1/CPU.vhd}
vcom -93 -work work {C:/Users/Adam-Martin/Documents/Intel/QuartusPrime/NWI_108A1/INTERRUPT.vhd}

