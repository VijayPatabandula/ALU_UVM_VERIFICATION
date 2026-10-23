class subscriber extends uvm_subscriber#(seq_item);
	`uvm_component_utils(subscriber)
	seq_item tr; 

	covergroup cg;

		cp1:coverpoint tr.a{bins low={[0:10]};
		bins med={[11:20]};
		bins high={[21:31]};}

		cp2:coverpoint tr.b{bins low={[0:10]};
		bins med={[11:20]};
		bins high={[21:31]};}

		cp3:coverpoint tr.s{bins b1={[0:7]};}

		cp4:coverpoint tr.y{bins zero={0};
		bins low={[1:100]};
		bins med={[101:600]};
		bins high={[601:1023]};}

		cross cp1,cp2,cp3;

	endgroup

	function new(string name="subscriber",uvm_component parent);
		super.new(name,parent);
		cg=new();
	endfunction 

	function void write(seq_item t);
		tr=t;
		cg.sample();

		`uvm_info("COVERAGE",$sformatf("coverage values : a=%0d,b=%0d,s=%0d,y=%0d",tr.a,tr.b,tr.s,tr.y),UVM_LOW)

	endfunction 

	function void report_phase(uvm_phase phase);
		super.report_phase(phase);

		`uvm_info("COVERAGE REPORT",$sformatf("coverage report=%0.2f%%",cg.get_coverage()),UVM_LOW)
	endfunction 
endclass

