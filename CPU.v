//Tom Lisa Anisha so hawt
 `timescale 1 ns / 1 ps
`include "pc.v"
`include "memory.v"
`include "ctrl_unit.v"
`include "instrdecode.v"
`include "mux.v"

module pipelineCPU
(
    input clk,
    output whatever
);

//instructions - stage 1
pc programcounter(clk, enable, PCaddr);
Instr_memory iMem(clk, regWE, IMaddr, DataIn, DataOut);
//pipeline register
registerIF rif(wrenable, clk, dataout, PCaddr);

/*    input clk,input [31:0] instrd,input pcplus4d,input [31:0] ResultW,input [4:0] writeRegW,input RegWriteW,output pcplus4e,output seImm,output [4:0] rte,output [4:0] rde,output [31:0] rd1,output [31:0] rd2 */
instrDecode iDstage(clk, );
//ctrl unit here

//insert pipeline register

/*input [31:0] rd1,
input [31:0] rd2,
input [31:0] rtE,
input [31:0] rdE,
input RegDstE,
input ALUSrcE,
input [2:0] ALUCtrlE,
input [31:0] seImm,
input pcaddr,
output [31:0] aluout,
output writedatae,
output [31:0] writeregE,
output pcbranch */
EXEC executestage();

//insert pipeline register

//  input clk, regWE,input[31:0] Addr,input[31:0] DataIn,output[31:0]  DataOut
Data_memory dMem(clk, MemWriteM, aluout, writedatam, readdatam);

//insert pipeline register

//    input input1, input input2,input select,output reg out
mux2to1 writebackmux(aluout, readdataW, MemtoRegW,ResultW);

endmodule
