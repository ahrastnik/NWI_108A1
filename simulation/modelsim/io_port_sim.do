onerror {resume}
quietly virtual signal -install /nwi_108a1/UA0 { /nwi_108a1/UA0/ustat(2 downto 0)} TX_bit_cnt
quietly virtual signal -install /nwi_108a1/UA0 { /nwi_108a1/UA0/ustat(5 downto 3)} RX_bit_cnt
quietly virtual signal -install /nwi_108a1/UA0 { /nwi_108a1/UA0/cnts(7 downto 4)} RX_bit_cnt001
quietly virtual signal -install /nwi_108a1/UA0 { /nwi_108a1/UA0/cnts(3 downto 0)} TX_bit_cnt001
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Inputs/Outputs
add wave -noupdate /nwi_108a1/clk
add wave -noupdate /nwi_108a1/rst
add wave -noupdate /nwi_108a1/pins(1)
add wave -noupdate /nwi_108a1/pins(0)
add wave -noupdate -divider CPU
add wave -noupdate /nwi_108a1/U_CPU/state
add wave -noupdate -radix unsigned -childformat {{/nwi_108a1/U_CPU/pc(7) -radix unsigned} {/nwi_108a1/U_CPU/pc(6) -radix unsigned} {/nwi_108a1/U_CPU/pc(5) -radix unsigned} {/nwi_108a1/U_CPU/pc(4) -radix unsigned} {/nwi_108a1/U_CPU/pc(3) -radix unsigned} {/nwi_108a1/U_CPU/pc(2) -radix unsigned} {/nwi_108a1/U_CPU/pc(1) -radix unsigned} {/nwi_108a1/U_CPU/pc(0) -radix unsigned}} -subitemconfig {/nwi_108a1/U_CPU/pc(7) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/pc(6) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/pc(5) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/pc(4) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/pc(3) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/pc(2) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/pc(1) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/pc(0) {-height 15 -radix unsigned}} /nwi_108a1/U_CPU/pc
add wave -noupdate -radix hexadecimal -childformat {{/nwi_108a1/U_CPU/inst(7) -radix hexadecimal} {/nwi_108a1/U_CPU/inst(6) -radix hexadecimal} {/nwi_108a1/U_CPU/inst(5) -radix hexadecimal} {/nwi_108a1/U_CPU/inst(4) -radix hexadecimal} {/nwi_108a1/U_CPU/inst(3) -radix hexadecimal} {/nwi_108a1/U_CPU/inst(2) -radix hexadecimal} {/nwi_108a1/U_CPU/inst(1) -radix hexadecimal} {/nwi_108a1/U_CPU/inst(0) -radix hexadecimal}} -subitemconfig {/nwi_108a1/U_CPU/inst(7) {-height 15 -radix hexadecimal} /nwi_108a1/U_CPU/inst(6) {-height 15 -radix hexadecimal} /nwi_108a1/U_CPU/inst(5) {-height 15 -radix hexadecimal} /nwi_108a1/U_CPU/inst(4) {-height 15 -radix hexadecimal} /nwi_108a1/U_CPU/inst(3) {-height 15 -radix hexadecimal} /nwi_108a1/U_CPU/inst(2) {-height 15 -radix hexadecimal} /nwi_108a1/U_CPU/inst(1) {-height 15 -radix hexadecimal} /nwi_108a1/U_CPU/inst(0) {-height 15 -radix hexadecimal}} /nwi_108a1/U_CPU/inst
add wave -noupdate -radix hexadecimal /nwi_108a1/U_CPU/inst_next
add wave -noupdate -radix hexadecimal /nwi_108a1/U_CPU/rom_data
add wave -noupdate -radix hexadecimal /nwi_108a1/U_CPU/rom_data_next
add wave -noupdate -radix decimal /nwi_108a1/U_CPU/rom_adr
add wave -noupdate -radix unsigned /nwi_108a1/U_CPU/stack
add wave -noupdate -radix unsigned /nwi_108a1/U_CPU/retr
add wave -noupdate /nwi_108a1/U_CPU/stat
add wave -noupdate /nwi_108a1/U_CPU/cont
add wave -noupdate -radix unsigned /nwi_108a1/U_CPU/reg1
add wave -noupdate -radix unsigned /nwi_108a1/U_CPU/reg2
add wave -noupdate -radix unsigned /nwi_108a1/U_CPU/acu
add wave -noupdate -radix unsigned -childformat {{/nwi_108a1/U_CPU/gprs(0) -radix unsigned -childformat {{/nwi_108a1/U_CPU/gprs(0)(7) -radix unsigned} {/nwi_108a1/U_CPU/gprs(0)(6) -radix unsigned} {/nwi_108a1/U_CPU/gprs(0)(5) -radix unsigned} {/nwi_108a1/U_CPU/gprs(0)(4) -radix unsigned} {/nwi_108a1/U_CPU/gprs(0)(3) -radix unsigned} {/nwi_108a1/U_CPU/gprs(0)(2) -radix unsigned} {/nwi_108a1/U_CPU/gprs(0)(1) -radix unsigned} {/nwi_108a1/U_CPU/gprs(0)(0) -radix unsigned}}} {/nwi_108a1/U_CPU/gprs(1) -radix unsigned -childformat {{/nwi_108a1/U_CPU/gprs(1)(7) -radix unsigned} {/nwi_108a1/U_CPU/gprs(1)(6) -radix unsigned} {/nwi_108a1/U_CPU/gprs(1)(5) -radix unsigned} {/nwi_108a1/U_CPU/gprs(1)(4) -radix unsigned} {/nwi_108a1/U_CPU/gprs(1)(3) -radix unsigned} {/nwi_108a1/U_CPU/gprs(1)(2) -radix unsigned} {/nwi_108a1/U_CPU/gprs(1)(1) -radix unsigned} {/nwi_108a1/U_CPU/gprs(1)(0) -radix unsigned}}} {/nwi_108a1/U_CPU/gprs(2) -radix unsigned -childformat {{/nwi_108a1/U_CPU/gprs(2)(7) -radix unsigned} {/nwi_108a1/U_CPU/gprs(2)(6) -radix unsigned} {/nwi_108a1/U_CPU/gprs(2)(5) -radix unsigned} {/nwi_108a1/U_CPU/gprs(2)(4) -radix unsigned} {/nwi_108a1/U_CPU/gprs(2)(3) -radix unsigned} {/nwi_108a1/U_CPU/gprs(2)(2) -radix unsigned} {/nwi_108a1/U_CPU/gprs(2)(1) -radix unsigned} {/nwi_108a1/U_CPU/gprs(2)(0) -radix unsigned}}} {/nwi_108a1/U_CPU/gprs(3) -radix unsigned -childformat {{/nwi_108a1/U_CPU/gprs(3)(7) -radix unsigned} {/nwi_108a1/U_CPU/gprs(3)(6) -radix unsigned} {/nwi_108a1/U_CPU/gprs(3)(5) -radix unsigned} {/nwi_108a1/U_CPU/gprs(3)(4) -radix unsigned} {/nwi_108a1/U_CPU/gprs(3)(3) -radix unsigned} {/nwi_108a1/U_CPU/gprs(3)(2) -radix unsigned} {/nwi_108a1/U_CPU/gprs(3)(1) -radix unsigned} {/nwi_108a1/U_CPU/gprs(3)(0) -radix unsigned}}}} -subitemconfig {/nwi_108a1/U_CPU/gprs(0) {-height 15 -radix unsigned -childformat {{/nwi_108a1/U_CPU/gprs(0)(7) -radix unsigned} {/nwi_108a1/U_CPU/gprs(0)(6) -radix unsigned} {/nwi_108a1/U_CPU/gprs(0)(5) -radix unsigned} {/nwi_108a1/U_CPU/gprs(0)(4) -radix unsigned} {/nwi_108a1/U_CPU/gprs(0)(3) -radix unsigned} {/nwi_108a1/U_CPU/gprs(0)(2) -radix unsigned} {/nwi_108a1/U_CPU/gprs(0)(1) -radix unsigned} {/nwi_108a1/U_CPU/gprs(0)(0) -radix unsigned}}} /nwi_108a1/U_CPU/gprs(0)(7) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(0)(6) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(0)(5) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(0)(4) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(0)(3) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(0)(2) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(0)(1) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(0)(0) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(1) {-height 15 -radix unsigned -childformat {{/nwi_108a1/U_CPU/gprs(1)(7) -radix unsigned} {/nwi_108a1/U_CPU/gprs(1)(6) -radix unsigned} {/nwi_108a1/U_CPU/gprs(1)(5) -radix unsigned} {/nwi_108a1/U_CPU/gprs(1)(4) -radix unsigned} {/nwi_108a1/U_CPU/gprs(1)(3) -radix unsigned} {/nwi_108a1/U_CPU/gprs(1)(2) -radix unsigned} {/nwi_108a1/U_CPU/gprs(1)(1) -radix unsigned} {/nwi_108a1/U_CPU/gprs(1)(0) -radix unsigned}}} /nwi_108a1/U_CPU/gprs(1)(7) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(1)(6) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(1)(5) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(1)(4) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(1)(3) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(1)(2) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(1)(1) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(1)(0) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(2) {-height 15 -radix unsigned -childformat {{/nwi_108a1/U_CPU/gprs(2)(7) -radix unsigned} {/nwi_108a1/U_CPU/gprs(2)(6) -radix unsigned} {/nwi_108a1/U_CPU/gprs(2)(5) -radix unsigned} {/nwi_108a1/U_CPU/gprs(2)(4) -radix unsigned} {/nwi_108a1/U_CPU/gprs(2)(3) -radix unsigned} {/nwi_108a1/U_CPU/gprs(2)(2) -radix unsigned} {/nwi_108a1/U_CPU/gprs(2)(1) -radix unsigned} {/nwi_108a1/U_CPU/gprs(2)(0) -radix unsigned}}} /nwi_108a1/U_CPU/gprs(2)(7) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(2)(6) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(2)(5) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(2)(4) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(2)(3) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(2)(2) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(2)(1) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(2)(0) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(3) {-height 15 -radix unsigned -childformat {{/nwi_108a1/U_CPU/gprs(3)(7) -radix unsigned} {/nwi_108a1/U_CPU/gprs(3)(6) -radix unsigned} {/nwi_108a1/U_CPU/gprs(3)(5) -radix unsigned} {/nwi_108a1/U_CPU/gprs(3)(4) -radix unsigned} {/nwi_108a1/U_CPU/gprs(3)(3) -radix unsigned} {/nwi_108a1/U_CPU/gprs(3)(2) -radix unsigned} {/nwi_108a1/U_CPU/gprs(3)(1) -radix unsigned} {/nwi_108a1/U_CPU/gprs(3)(0) -radix unsigned}}} /nwi_108a1/U_CPU/gprs(3)(7) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(3)(6) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(3)(5) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(3)(4) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(3)(3) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(3)(2) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(3)(1) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(3)(0) {-height 15 -radix unsigned}} /nwi_108a1/U_CPU/gprs
add wave -noupdate -divider Bus
add wave -noupdate /nwi_108a1/BUS_M/space
add wave -noupdate /nwi_108a1/BUS_M/we_i
add wave -noupdate -radix hexadecimal /nwi_108a1/BUS_M/adr_i
add wave -noupdate -radix unsigned /nwi_108a1/BUS_M/data_i
add wave -noupdate -radix unsigned /nwi_108a1/BUS_M/data_o
add wave -noupdate -divider {IO Port}
add wave -noupdate /nwi_108a1/BANK0/pin_buff
add wave -noupdate /nwi_108a1/BANK0/irqs
add wave -noupdate /nwi_108a1/BANK0/ir_trg
add wave -noupdate /nwi_108a1/BANK0/pin
add wave -noupdate /nwi_108a1/BANK0/dir
add wave -noupdate /nwi_108a1/BANK0/ire
add wave -noupdate -divider {IO Port-Bus}
add wave -noupdate -radix unsigned /nwi_108a1/BANK0/data_i
add wave -noupdate -radix unsigned /nwi_108a1/BANK0/adr_i
add wave -noupdate /nwi_108a1/BANK0/we_i
add wave -noupdate -radix unsigned /nwi_108a1/BANK0/data_o
add wave -noupdate -radix unsigned /nwi_108a1/BANK0/reg_data
add wave -noupdate -divider Timer
add wave -noupdate /nwi_108a1/T0/irq
add wave -noupdate /nwi_108a1/T0/tcon
add wave -noupdate -radix unsigned /nwi_108a1/T0/cmpa
add wave -noupdate -radix unsigned /nwi_108a1/T0/preScaler
add wave -noupdate -radix unsigned /nwi_108a1/T0/T
add wave -noupdate -radix unsigned /nwi_108a1/T0/clk_ms
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {766159 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 214
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {485468 ps} {1136468 ps}
