`timescale 1ns / 1ps
//*************************************************************************
//   > �ļ���: tb.v
//   > ����  :�弶��ˮCPU��testbench
//   > ����  : trialley
//   > ����  : 2019-05-03
//*************************************************************************
module tb(//������潫��ʾ��ģ��Ķ˿�

    input  [ 4:0] rf_addr,
    input  [31:0] mem_addr,
    
    output [31:0] rf_data,
    output [31:0] mem_data,
    output [31:0] IF_pc,//ȡָ��ַ
    output [31:0] IF_inst,//ȡ����ָ��
    output [31:0] ID_pc,//
    output [31:0] EXE_pc,
    output [31:0] MEM_pc,
    output [31:0] WB_pc,
    
    //5����ˮ����
    output [31:0] cpu_5_valid,
    output [31:0] HI_data,
    output [31:0] LO_data
    );
	
	//ʵ����CPU
	reg resetn;
    reg clk;
	pipeline_cpu cpu(
		.clk     (clk ),
		.resetn  (resetn  ),

		.rf_addr (rf_addr ),
		.mem_addr(mem_addr),
		.rf_data (rf_data ),
		.mem_data(mem_data),
		.IF_pc   (IF_pc   ),
		.IF_inst (IF_inst ),
		.ID_pc   (ID_pc   ),
		.EXE_pc  (EXE_pc  ),
		.MEM_pc  (MEM_pc  ),
		.WB_pc   (WB_pc   ),
		.cpu_5_valid (cpu_5_valid),
		  .HI_data (HI_data ),
		  .LO_data (LO_data )
	);

	//���濪ʼ
	initial begin
		clk = 0;
		#10000 resetn=0;
		#20000 resetn=1;
		
		forever #5000 clk = ~clk;
	end
	
endmodule

