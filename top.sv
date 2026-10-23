`include "uvm_macros.svh"
import uvm_pkg::*;

`include "seq_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "interface.sv"
`include "driver.sv"
`include "monitor.sv"
`include "coverage.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"
`include "dut.sv"
`include "assertions.sv"


module top;

inf vif();

alu al(.a(vif.a),.b(vif.b),.s(vif.s),.y(vif.y));

bind alu alu_assert d1(.a(a),.b(b),.s(s),.y(y));

initial begin 
	uvm_config_db#(virtual inf)::set(null,"*","vif",vif);
	run_test("test");
end

endmodule
