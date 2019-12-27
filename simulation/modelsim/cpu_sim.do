onerror {resume}
quietly virtual signal -install /nwi_108a1/UA0 { /nwi_108a1/UA0/ustat(2 downto 0)} TX_bit_cnt
quietly virtual signal -install /nwi_108a1/UA0 { /nwi_108a1/UA0/ustat(5 downto 3)} RX_bit_cnt
quietly virtual signal -install /nwi_108a1/UA0 { /nwi_108a1/UA0/cnts(7 downto 4)} RX_bit_cnt001
quietly virtual signal -install /nwi_108a1/UA0 { /nwi_108a1/UA0/cnts(3 downto 0)} TX_bit_cnt001
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Inputs/Outputs
add wave -noupdate /nwi_108a1/clk
add wave -noupdate /nwi_108a1/rst
add wave -noupdate /nwi_108a1/pin1
add wave -noupdate /nwi_108a1/pin2
add wave -noupdate /nwi_108a1/tx
add wave -noupdate /nwi_108a1/rx
add wave -noupdate -divider CPU
add wave -noupdate /nwi_108a1/U_CPU/state
add wave -noupdate -radix unsigned /nwi_108a1/U_CPU/pc
add wave -noupdate -radix unsigned /nwi_108a1/U_CPU/stack
add wave -noupdate -radix unsigned /nwi_108a1/U_CPU/retr
add wave -noupdate -radix unsigned /nwi_108a1/U_CPU/nest
add wave -noupdate /nwi_108a1/U_CPU/conf
add wave -noupdate /nwi_108a1/U_CPU/cont
add wave -noupdate /nwi_108a1/U_CPU/stat
add wave -noupdate /nwi_108a1/we
add wave -noupdate -radix unsigned /nwi_108a1/U_CPU/ram_adr
add wave -noupdate -radix unsigned /nwi_108a1/U_CPU/prog_adr
add wave -noupdate /nwi_108a1/U_CPU/prog_data
add wave -noupdate /nwi_108a1/U_CPU/next_data
add wave -noupdate -radix unsigned -childformat {{/nwi_108a1/U_CPU/ram_data(7) -radix unsigned} {/nwi_108a1/U_CPU/ram_data(6) -radix unsigned} {/nwi_108a1/U_CPU/ram_data(5) -radix unsigned} {/nwi_108a1/U_CPU/ram_data(4) -radix unsigned} {/nwi_108a1/U_CPU/ram_data(3) -radix unsigned} {/nwi_108a1/U_CPU/ram_data(2) -radix unsigned} {/nwi_108a1/U_CPU/ram_data(1) -radix unsigned} {/nwi_108a1/U_CPU/ram_data(0) -radix unsigned}} -subitemconfig {/nwi_108a1/U_CPU/ram_data(7) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/ram_data(6) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/ram_data(5) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/ram_data(4) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/ram_data(3) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/ram_data(2) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/ram_data(1) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/ram_data(0) {-height 15 -radix unsigned}} /nwi_108a1/U_CPU/ram_data
add wave -noupdate -radix unsigned -childformat {{/nwi_108a1/U_CPU/dout(7) -radix unsigned} {/nwi_108a1/U_CPU/dout(6) -radix unsigned} {/nwi_108a1/U_CPU/dout(5) -radix unsigned} {/nwi_108a1/U_CPU/dout(4) -radix unsigned} {/nwi_108a1/U_CPU/dout(3) -radix unsigned} {/nwi_108a1/U_CPU/dout(2) -radix unsigned} {/nwi_108a1/U_CPU/dout(1) -radix unsigned} {/nwi_108a1/U_CPU/dout(0) -radix unsigned}} -subitemconfig {/nwi_108a1/U_CPU/dout(7) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/dout(6) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/dout(5) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/dout(4) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/dout(3) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/dout(2) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/dout(1) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/dout(0) {-height 15 -radix unsigned}} /nwi_108a1/U_CPU/dout
add wave -noupdate -radix unsigned /nwi_108a1/U_CPU/reg1
add wave -noupdate -radix unsigned /nwi_108a1/U_CPU/reg2
add wave -noupdate -radix unsigned /nwi_108a1/U_CPU/acu
add wave -noupdate -radix unsigned -childformat {{/nwi_108a1/U_CPU/gprs(0) -radix unsigned -childformat {{/nwi_108a1/U_CPU/gprs(0)(7) -radix unsigned} {/nwi_108a1/U_CPU/gprs(0)(6) -radix unsigned} {/nwi_108a1/U_CPU/gprs(0)(5) -radix unsigned} {/nwi_108a1/U_CPU/gprs(0)(4) -radix unsigned} {/nwi_108a1/U_CPU/gprs(0)(3) -radix unsigned} {/nwi_108a1/U_CPU/gprs(0)(2) -radix unsigned} {/nwi_108a1/U_CPU/gprs(0)(1) -radix unsigned} {/nwi_108a1/U_CPU/gprs(0)(0) -radix unsigned}}} {/nwi_108a1/U_CPU/gprs(1) -radix unsigned -childformat {{/nwi_108a1/U_CPU/gprs(1)(7) -radix unsigned} {/nwi_108a1/U_CPU/gprs(1)(6) -radix unsigned} {/nwi_108a1/U_CPU/gprs(1)(5) -radix unsigned} {/nwi_108a1/U_CPU/gprs(1)(4) -radix unsigned} {/nwi_108a1/U_CPU/gprs(1)(3) -radix unsigned} {/nwi_108a1/U_CPU/gprs(1)(2) -radix unsigned} {/nwi_108a1/U_CPU/gprs(1)(1) -radix unsigned} {/nwi_108a1/U_CPU/gprs(1)(0) -radix unsigned}}} {/nwi_108a1/U_CPU/gprs(2) -radix unsigned -childformat {{/nwi_108a1/U_CPU/gprs(2)(7) -radix unsigned} {/nwi_108a1/U_CPU/gprs(2)(6) -radix unsigned} {/nwi_108a1/U_CPU/gprs(2)(5) -radix unsigned} {/nwi_108a1/U_CPU/gprs(2)(4) -radix unsigned} {/nwi_108a1/U_CPU/gprs(2)(3) -radix unsigned} {/nwi_108a1/U_CPU/gprs(2)(2) -radix unsigned} {/nwi_108a1/U_CPU/gprs(2)(1) -radix unsigned} {/nwi_108a1/U_CPU/gprs(2)(0) -radix unsigned}}} {/nwi_108a1/U_CPU/gprs(3) -radix unsigned -childformat {{/nwi_108a1/U_CPU/gprs(3)(7) -radix unsigned} {/nwi_108a1/U_CPU/gprs(3)(6) -radix unsigned} {/nwi_108a1/U_CPU/gprs(3)(5) -radix unsigned} {/nwi_108a1/U_CPU/gprs(3)(4) -radix unsigned} {/nwi_108a1/U_CPU/gprs(3)(3) -radix unsigned} {/nwi_108a1/U_CPU/gprs(3)(2) -radix unsigned} {/nwi_108a1/U_CPU/gprs(3)(1) -radix unsigned} {/nwi_108a1/U_CPU/gprs(3)(0) -radix unsigned}}}} -subitemconfig {/nwi_108a1/U_CPU/gprs(0) {-height 15 -radix unsigned -childformat {{/nwi_108a1/U_CPU/gprs(0)(7) -radix unsigned} {/nwi_108a1/U_CPU/gprs(0)(6) -radix unsigned} {/nwi_108a1/U_CPU/gprs(0)(5) -radix unsigned} {/nwi_108a1/U_CPU/gprs(0)(4) -radix unsigned} {/nwi_108a1/U_CPU/gprs(0)(3) -radix unsigned} {/nwi_108a1/U_CPU/gprs(0)(2) -radix unsigned} {/nwi_108a1/U_CPU/gprs(0)(1) -radix unsigned} {/nwi_108a1/U_CPU/gprs(0)(0) -radix unsigned}}} /nwi_108a1/U_CPU/gprs(0)(7) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(0)(6) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(0)(5) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(0)(4) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(0)(3) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(0)(2) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(0)(1) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(0)(0) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(1) {-height 15 -radix unsigned -childformat {{/nwi_108a1/U_CPU/gprs(1)(7) -radix unsigned} {/nwi_108a1/U_CPU/gprs(1)(6) -radix unsigned} {/nwi_108a1/U_CPU/gprs(1)(5) -radix unsigned} {/nwi_108a1/U_CPU/gprs(1)(4) -radix unsigned} {/nwi_108a1/U_CPU/gprs(1)(3) -radix unsigned} {/nwi_108a1/U_CPU/gprs(1)(2) -radix unsigned} {/nwi_108a1/U_CPU/gprs(1)(1) -radix unsigned} {/nwi_108a1/U_CPU/gprs(1)(0) -radix unsigned}}} /nwi_108a1/U_CPU/gprs(1)(7) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(1)(6) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(1)(5) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(1)(4) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(1)(3) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(1)(2) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(1)(1) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(1)(0) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(2) {-height 15 -radix unsigned -childformat {{/nwi_108a1/U_CPU/gprs(2)(7) -radix unsigned} {/nwi_108a1/U_CPU/gprs(2)(6) -radix unsigned} {/nwi_108a1/U_CPU/gprs(2)(5) -radix unsigned} {/nwi_108a1/U_CPU/gprs(2)(4) -radix unsigned} {/nwi_108a1/U_CPU/gprs(2)(3) -radix unsigned} {/nwi_108a1/U_CPU/gprs(2)(2) -radix unsigned} {/nwi_108a1/U_CPU/gprs(2)(1) -radix unsigned} {/nwi_108a1/U_CPU/gprs(2)(0) -radix unsigned}}} /nwi_108a1/U_CPU/gprs(2)(7) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(2)(6) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(2)(5) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(2)(4) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(2)(3) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(2)(2) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(2)(1) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(2)(0) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(3) {-height 15 -radix unsigned -childformat {{/nwi_108a1/U_CPU/gprs(3)(7) -radix unsigned} {/nwi_108a1/U_CPU/gprs(3)(6) -radix unsigned} {/nwi_108a1/U_CPU/gprs(3)(5) -radix unsigned} {/nwi_108a1/U_CPU/gprs(3)(4) -radix unsigned} {/nwi_108a1/U_CPU/gprs(3)(3) -radix unsigned} {/nwi_108a1/U_CPU/gprs(3)(2) -radix unsigned} {/nwi_108a1/U_CPU/gprs(3)(1) -radix unsigned} {/nwi_108a1/U_CPU/gprs(3)(0) -radix unsigned}}} /nwi_108a1/U_CPU/gprs(3)(7) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(3)(6) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(3)(5) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(3)(4) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(3)(3) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(3)(2) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(3)(1) {-height 15 -radix unsigned} /nwi_108a1/U_CPU/gprs(3)(0) {-height 15 -radix unsigned}} /nwi_108a1/U_CPU/gprs
add wave -noupdate -divider Interrupts
add wave -noupdate -radix unsigned /nwi_108a1/U_CPU/irq_adr
add wave -noupdate /nwi_108a1/U_CPU/irqs
add wave -noupdate /nwi_108a1/U_CPU/U_INT/last_irqs
add wave -noupdate -divider Memory
add wave -noupdate /nwi_108a1/MEM/datamem
add wave -noupdate /nwi_108a1/MEM/progmem
add wave -noupdate -divider Timer-T0
add wave -noupdate /nwi_108a1/T0/irq
add wave -noupdate -radix unsigned /nwi_108a1/T0/T
add wave -noupdate -radix unsigned /nwi_108a1/T0/preScaler
add wave -noupdate -radix unsigned /nwi_108a1/T0/clk_ms
add wave -noupdate /nwi_108a1/T0/tcon
add wave -noupdate -radix unsigned /nwi_108a1/T0/cmpa
add wave -noupdate -divider UART-UA0
add wave -noupdate /nwi_108a1/UA0/clk_baud
add wave -noupdate /nwi_108a1/UA0/clk_tx
add wave -noupdate /nwi_108a1/UA0/clk_rx
add wave -noupdate -radix unsigned /nwi_108a1/UA0/T
add wave -noupdate -radix unsigned /nwi_108a1/UA0/preScaler
add wave -noupdate -radix unsigned /nwi_108a1/UA0/ucmp
add wave -noupdate /nwi_108a1/UA0/baud_cnt
add wave -noupdate /nwi_108a1/UA0/rx_sync_cnt
add wave -noupdate /nwi_108a1/UA0/rx_sync
add wave -noupdate /nwi_108a1/UA0/rx_desync
add wave -noupdate /nwi_108a1/UA0/uconta
add wave -noupdate /nwi_108a1/UA0/ucontb
add wave -noupdate /nwi_108a1/UA0/ustat
add wave -noupdate /nwi_108a1/UA0/cnts
add wave -noupdate /nwi_108a1/UA0/tx_send
add wave -noupdate /nwi_108a1/UA0/tx_st
add wave -noupdate -radix unsigned /nwi_108a1/UA0/TX_bit_cnt001
add wave -noupdate /nwi_108a1/UA0/TX_buf
add wave -noupdate /nwi_108a1/UA0/rx_st
add wave -noupdate -radix unsigned -childformat {{/nwi_108a1/UA0/RX_bit_cnt001(7) -radix unsigned} {/nwi_108a1/UA0/RX_bit_cnt001(6) -radix unsigned} {/nwi_108a1/UA0/RX_bit_cnt001(5) -radix unsigned} {/nwi_108a1/UA0/RX_bit_cnt001(4) -radix unsigned}} -subitemconfig {/nwi_108a1/UA0/cnts(7) {-radix unsigned} /nwi_108a1/UA0/cnts(6) {-radix unsigned} /nwi_108a1/UA0/cnts(5) {-radix unsigned} /nwi_108a1/UA0/cnts(4) {-radix unsigned}} /nwi_108a1/UA0/RX_bit_cnt001
add wave -noupdate /nwi_108a1/UA0/RX_buf
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3118546 ps} 0}
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
WaveRestoreZoom {0 ps} {19377738 ps}
