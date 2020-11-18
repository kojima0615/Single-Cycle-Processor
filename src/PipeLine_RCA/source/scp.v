`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/06 10:41:05
// Design Name: 
// Module Name: scp
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Scp_pipe(clk,rst,Jump);
    input clk,rst;
    output Jump;
    //wire
    //IF
    wire Jump;
    wire [31:0]IF_pc4;
    wire [31:0]IF_order;
    
    //ID
    wire [31:0]ID_pc4,ID_order;
    wire ID_RegDst,Jump,ID_Branch,ID_MemRead,ID_MemtoReg,ID_ALUOp0,ID_ALUOp1,ID_MemWrite,ID_ALUSrc,ID_RegWrite;
    wire [31:0]ID_read_data1,ID_read_data2,ID_extend_order;
    
    //EX
    wire  EX_RegDst,EX_Branch,EX_MemRead,EX_MemtoReg,EX_ALUOp0,EX_ALUOp1,EX_MemWrite,EX_ALUSrc,EX_RegWrite;
    wire  [31:0]EX_read_data1,EX_read_data2,EX_extend_order,EX_pc4,EX_order;
    wire EX_zero_flag;
    wire [3:0]EX_ALUctl;
    wire [31:0]EX_read_data_mux,EX_alu_result,EX_alu_result_pc,EX_extend_order_leftshift;
    wire [4:0]EX_write_reg;
    wire [1:0]EX_forwarding_out1,EX_forwarding_out2;
    wire [31:0]EX_Alu_in1, EX_Alu_in2;
    
    //MEM
    wire [31:0] MEM_alu_result_pc,MEM_alu_result, MEM_read_data2, MEM_read_data_mem;
    wire [4:0]MEM_write_reg;
    wire MEM_zero_flag,MEM_MemtoReg, MEM_MemRead, MEM_MemWrite, MEM_Branch,MEM_RegWrite;
    
    //WB
    wire [4:0]WB_write_reg;
    wire [31:0]WB_write_reg_data, WB_read_data_mem, WB_alu_result;
    wire WB_MemtoReg, WB_RegWrite;
    
    //hazard
     wire hazard;
     wire PCsrc;
     assign hazard=EX_MemRead&((EX_order[20:16]==ID_order[25:21])|(EX_order[20:16]==ID_order[20:16]));
     assign PCsrc=MEM_zero_flag & MEM_Branch;
    
    //pipeline_control
    IF_ID if_id(clk,!(!rst|Jump|PCsrc),IF_pc4,IF_order,hazard,ID_pc4,ID_order);//rstÇÕïœçXÇµÇ‹Ç∑
    
    ID_EX id_ex(clk, !(!rst|hazard|PCsrc), ID_RegDst, ID_Branch, ID_MemRead, ID_MemtoReg, ID_ALUOp0, ID_ALUOp1, ID_MemWrite, ID_ALUSrc, ID_RegWrite,
    EX_RegDst,EX_Branch,EX_MemRead,EX_MemtoReg,EX_ALUOp0,EX_ALUOp1,EX_MemWrite,EX_ALUSrc,EX_RegWrite,
    ID_read_data1,ID_read_data2,ID_extend_order,ID_pc4,ID_order,EX_read_data1,EX_read_data2,EX_extend_order,EX_pc4,EX_order);
    
    EX_MEM ex_mem(clk, !(!rst|PCsrc), EX_MemtoReg, EX_MemRead, EX_MemWrite, EX_Branch,EX_RegWrite, EX_write_reg, EX_alu_result, EX_alu_result_pc,EX_read_data2, EX_zero_flag,
    MEM_MemtoReg, MEM_MemRead, MEM_MemWrite, MEM_Branch,MEM_RegWrite, MEM_write_reg, MEM_alu_result, MEM_alu_result_pc, MEM_read_data2,MEM_zero_flag);
    
     MEM_WB mem_wb(clk, rst, MEM_MemtoReg, MEM_RegWrite, MEM_read_data_mem, MEM_alu_result, MEM_write_reg,
     WB_MemtoReg, WB_RegWrite, WB_read_data_mem, WB_alu_result, WB_write_reg);
    
    wire [31:0]to_mux1,shift_order;
    //IF
     PC_CTRL32 pc_ctrl(clk,rst,to_mux1,MEM_alu_result_pc, PCsrc, Jump,hazard, IF_order,IF_pc4);//àÍïîEXÇä‹Çﬁ
     
     assign shift_order={ID_order[25:0],2'b00};
    assign to_mux1={ID_pc4[31:28],shift_order[27:0]};
    
     //IF/ID
    
    wire [31:0]ID_read_data1_temp, ID_read_data2_temp;
    Controller controller(ID_order[31:26],ID_RegDst,Jump,ID_Branch,ID_MemRead,ID_MemtoReg,ID_ALUOp0,ID_ALUOp1,ID_MemWrite,ID_ALUSrc,ID_RegWrite);
    Register register(clk,rst,ID_order[25:21],ID_order[20:16],WB_write_reg,WB_write_reg_data,WB_RegWrite,ID_read_data1_temp,ID_read_data2_temp);
    assign ID_extend_order={16'b0000000000000000,ID_order[15:0]};
    assign ID_read_data1=(WB_RegWrite && WB_write_reg==ID_order[25:21]) ? WB_write_reg_data:ID_read_data1_temp;
    assign ID_read_data2=(WB_RegWrite && WB_write_reg==ID_order[20:16]) ? WB_write_reg_data:ID_read_data2_temp;
    
   //ID/EX
    
    assign EX_write_reg=(EX_RegDst)?EX_order[15:11]:EX_order[20:16];
    assign EX_extend_order_leftshift=({EX_extend_order[29:0],2'b00});
    Alu_Controller alu_controller({EX_ALUOp0,EX_ALUOp1},EX_order[5:0],EX_ALUctl);
    Mux mux_regi(EX_extend_order,EX_read_data2,EX_ALUSrc,EX_read_data_mux);//aluì¸óÕÇ÷
    Alu32 alu32_pc(4'b0010,EX_pc4,EX_extend_order_leftshift,EX_alu_result_pc,);
    //forward
    Forwarding_Unit forwarding_unit(EX_order[25:21], EX_order[20:16], MEM_RegWrite, WB_RegWrite, MEM_write_reg, WB_write_reg, EX_forwarding_out1, EX_forwarding_out2);
    //2bit mux
    assign EX_Alu_in1=(EX_forwarding_out1==2'b00)?EX_read_data1:
                    (EX_forwarding_out1==2'b01)?WB_write_reg_data:
                    (EX_forwarding_out1==2'b10)?MEM_alu_result:0;
     assign EX_Alu_in2=(EX_forwarding_out2==2'b00)?EX_read_data_mux:
                    (EX_forwarding_out2==2'b01)?WB_write_reg_data:
                    (EX_forwarding_out2==2'b10)?MEM_alu_result:0;
     Alu32 alu32(EX_ALUctl,EX_Alu_in1,EX_Alu_in2,EX_alu_result,EX_zero_flag);
                    
    //EX/MEM
    
    Data_mem data_mem(clk, rst, MEM_alu_result, MEM_read_data2,MEM_MemWrite,MEM_MemRead,MEM_read_data_mem);
    
    //MEM/WB
    Mux mux_mem(WB_read_data_mem, WB_alu_result, WB_MemtoReg, WB_write_reg_data);
endmodule
