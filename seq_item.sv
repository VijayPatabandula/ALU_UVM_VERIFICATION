class seq_item extends uvm_sequence_item;
	rand logic[4:0]a;
	rand logic[4:0]b;
	rand logic[2:0]s;
	logic[9:0]y;
	
	`uvm_object_utils_begin(seq_item)
	`uvm_field_int(a,UVM_DEFAULT)
	`uvm_field_int(b,UVM_DEFAULT)
	`uvm_field_int(s,UVM_DEFAULT)
	`uvm_field_int(y,UVM_DEFAULT)
	`uvm_object_utils_end

	function new(string name="seq_item");
		super.new(name);
	endfunction
        //constraints
	constraint c1{a inside{[0:31]};b inside {[0:31]};}

endclass


