class test extends uvm_test;
	`uvm_component_utils(test)

	env e1;
	seq se;

	function new(string name="test",uvm_component parent);
		super.new(name,parent);
	endfunction 

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);

		e1=env::type_id::create("e1",this);
		se=seq::type_id::create("se");
	endfunction

	task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		se.start(e1.age.sr);
		phase.drop_objection(this);
	endtask

endclass

