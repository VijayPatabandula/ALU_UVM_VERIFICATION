class env extends uvm_env;
	`uvm_component_utils(env)

	agent age;
	sb sco;
	subscriber sub;
	
	function new(string name="env",uvm_component parent);
		super.new(name,parent);
	endfunction 

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);

		age=agent::type_id::create("age",this);
		sco=sb::type_id::create("sco",this);
		sub=subscriber::type_id::create("sub",this);

	endfunction 

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);

		age.mon.ap1.connect(sco.ap2);
		age.mon.ap1.connect(sub.analysis_export);

	endfunction 

endclass


