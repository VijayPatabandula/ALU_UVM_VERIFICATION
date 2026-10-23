class sb extends uvm_scoreboard;
	`uvm_component_utils(sb)
	uvm_analysis_imp#(seq_item,sb)ap2;
	int pass_count;
	int fail_count;

	function new(string name="sb",uvm_component parent);
		super.new(name,parent);
		ap2=new("ap2",this);
	endfunction 

	virtual function void write(seq_item s1);

		bit[9:0]exp_y;

		case(s1.s)
			3'b000:exp_y=s1.a+s1.b;
			3'b001:exp_y=s1.a-s1.b;
			3'b010:exp_y=s1.a*s1.b;
			3'b011:exp_y=s1.a/s1.b;
			3'b100:exp_y=s1.a&s1.b;
			3'b101:exp_y=s1.a|s1.b;
			3'b110:exp_y=~(s1.a&s1.b);
			3'b111:exp_y=~(s1.a|s1.b);
			default:exp_y=s1.a^s1.b;
		endcase

		if(s1.y==exp_y)begin
			pass_count++;
			`uvm_info("SB",$sformatf("PASS : a=%0d,b=%0d,s=%0d,actual=%0d,expected=%0d",s1.a,s1.b,s1.s,s1.y,exp_y),UVM_LOW)
		end
		
		else begin 
			fail_count++;
			`uvm_info("SB",$sformatf("fail : a=%0d,b=%0d,s=%0d,actual=%0d,expected=%0d",s1.a,s1.b,s1.s,s1.y,exp_y),UVM_LOW)
		end

	endfunction 

	function void report_phase(uvm_phase phase);
		super.report_phase(phase);

		`uvm_info("SB",$sformatf("======================================================"),UVM_LOW)

		`uvm_info("SB",$sformatf("PASS COUNT=%0d",pass_count),UVM_LOW)
		`uvm_info("SB",$sformatf("FAIL COUNT=%0d",fail_count),UVM_LOW)

		`uvm_info("SB",$sformatf("======================================================="),UVM_LOW)

	endfunction 

endclass



