module alu_assert(input logic[4:0]a,b,input logic[2:0]s,input logic[9:0]y);


always@(*)begin

	assert(!$isunknown(y))
	else
		`uvm_error("ASSERTION","OUTPUT CONTAINS X/Z")

end

endmodule
	
