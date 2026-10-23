class driver extends uvm_driver#(seq_item);
	`uvm_component_utils(driver)

	virtual inf vif;

	function new(string name="driver",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);

		if(!uvm_config_db#(virtual inf)::get(this,"","vif",vif))
			`uvm_fatal("DRIVER INTERFACE","DRIVER INTERFACE NOT FOUND")
	endfunction

	task run_phase(uvm_phase phase);

		seq_item s1;

		forever begin
			seq_item_port.get_next_item(s1);
			vif.a=s1.a;
			vif.b=s1.b;
			vif.s=s1.s;
			#1;
			seq_item_port.item_done();

		end
	endtask 

endclass


