class agent extends uvm_agent;
	`uvm_component_utils(agent)

	sequencer sr;
	driver dri;
	monitor mon;

	function new(string name="agent",uvm_component parent);
		super.new(name,parent);
	endfunction 

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);

		sr=sequencer::type_id::create("sr",this);
		dri=driver::type_id::create("dri",this);
		mon=monitor::type_id::create("mon",this);

	endfunction 

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);

		dri.seq_item_port.connect(sr.seq_item_export);

	endfunction

endclass



