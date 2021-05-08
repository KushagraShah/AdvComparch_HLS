// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2019.2
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="kernel2,hls_ip_2019_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7k160t-fbg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=8.365000,HLS_SYN_LAT=1027,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=6,HLS_SYN_FF=204,HLS_SYN_LUT=342,HLS_VERSION=2019_2}" *)

module kernel2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        array_r_address0,
        array_r_ce0,
        array_r_we0,
        array_r_d0,
        array_r_q0,
        array_r_address1,
        array_r_ce1,
        array_r_q1
);

parameter    ap_ST_fsm_state1 = 6'd1;
parameter    ap_ST_fsm_state2 = 6'd2;
parameter    ap_ST_fsm_state3 = 6'd4;
parameter    ap_ST_fsm_state4 = 6'd8;
parameter    ap_ST_fsm_pp0_stage0 = 6'd16;
parameter    ap_ST_fsm_state8 = 6'd32;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [9:0] array_r_address0;
output   array_r_ce0;
output   array_r_we0;
output  [31:0] array_r_d0;
input  [31:0] array_r_q0;
output  [9:0] array_r_address1;
output   array_r_ce1;
input  [31:0] array_r_q1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[9:0] array_r_address0;
reg array_r_ce0;
reg array_r_we0;
reg[9:0] array_r_address1;
reg array_r_ce1;

(* fsm_encoding = "none" *) reg   [5:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [31:0] accum_0_reg_96;
reg   [10:0] i_0_reg_106;
reg   [10:0] i_0_reg_106_pp0_iter1_reg;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state5_pp0_stage0_iter0;
wire    ap_block_state6_pp0_stage0_iter1;
wire    ap_block_state7_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_11001;
reg  signed [31:0] prev_0_reg_118;
reg  signed [31:0] reg_128;
wire    ap_CS_fsm_state3;
reg    ap_enable_reg_pp0_iter1;
reg   [0:0] icmp_ln9_reg_215;
wire    ap_CS_fsm_state2;
reg   [31:0] elem2_reg_194;
reg  signed [31:0] array_load_1_reg_205;
wire   [31:0] accum_fu_133_p2;
wire    ap_CS_fsm_state4;
wire   [0:0] icmp_ln9_fu_138_p2;
reg   [0:0] icmp_ln9_reg_215_pp0_iter1_reg;
wire   [10:0] i_fu_155_p2;
reg   [10:0] i_reg_224;
reg    ap_enable_reg_pp0_iter0;
wire   [31:0] prev_1_fu_161_p2;
reg    ap_enable_reg_pp0_iter2;
wire   [31:0] accum_1_fu_178_p2;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state5;
reg   [10:0] ap_phi_mux_i_0_phi_fu_110_p4;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln12_fu_150_p1;
wire   [63:0] zext_ln11_fu_167_p1;
wire   [10:0] add_ln12_fu_144_p2;
wire   [31:0] mul_ln12_fu_172_p2;
wire    ap_CS_fsm_state8;
reg   [5:0] ap_NS_fsm;
reg    ap_block_pp0;
reg    ap_enable_operation_40;
reg    ap_enable_state7_pp0_iter2_stage0;
reg    ap_enable_operation_31;
reg    ap_enable_state5_pp0_iter0_stage0;
reg    ap_enable_operation_33;
reg    ap_enable_state6_pp0_iter1_stage0;
reg    ap_idle_pp0;
wire    ap_enable_pp0;

// power-on initialization
initial begin
#0 ap_CS_fsm = 6'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state5) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state4)) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            if ((1'b1 == ap_condition_pp0_exit_iter0_state5)) begin
                ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state5);
            end else if ((1'b1 == 1'b1)) begin
                ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end else if ((1'b1 == ap_CS_fsm_state4)) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln9_reg_215_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        accum_0_reg_96 <= accum_1_fu_178_p2;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        accum_0_reg_96 <= accum_fu_133_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln9_reg_215 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        i_0_reg_106 <= i_reg_224;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        i_0_reg_106 <= 11'd3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln9_reg_215_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        prev_0_reg_118 <= prev_1_fu_161_p2;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        prev_0_reg_118 <= elem2_reg_194;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln9_reg_215 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        reg_128 <= array_r_q1;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        reg_128 <= array_r_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        array_load_1_reg_205 <= array_r_q1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        elem2_reg_194 <= array_r_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        i_0_reg_106_pp0_iter1_reg <= i_0_reg_106;
        icmp_ln9_reg_215 <= icmp_ln9_fu_138_p2;
        icmp_ln9_reg_215_pp0_iter1_reg <= icmp_ln9_reg_215;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln9_fu_138_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        i_reg_224 <= i_fu_155_p2;
    end
end

always @ (*) begin
    if ((icmp_ln9_fu_138_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state5 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state5 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln9_reg_215 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_i_0_phi_fu_110_p4 = i_reg_224;
    end else begin
        ap_phi_mux_i_0_phi_fu_110_p4 = i_0_reg_106;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        array_r_address0 = zext_ln11_fu_167_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        array_r_address0 = 64'd1;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        array_r_address0 = 64'd2;
    end else begin
        array_r_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        array_r_address1 = zext_ln12_fu_150_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        array_r_address1 = 64'd0;
    end else begin
        array_r_address1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)))) begin
        array_r_ce0 = 1'b1;
    end else begin
        array_r_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | ((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
        array_r_ce1 = 1'b1;
    end else begin
        array_r_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln9_reg_215_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        array_r_we0 = 1'b1;
    end else begin
        array_r_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((icmp_ln9_fu_138_p2 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone)) & ~((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone)) | ((icmp_ln9_fu_138_p2 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign accum_1_fu_178_p2 = (mul_ln12_fu_172_p2 + accum_0_reg_96);

assign accum_fu_133_p2 = ($signed(array_load_1_reg_205) * $signed(reg_128));

assign add_ln12_fu_144_p2 = ($signed(ap_phi_mux_i_0_phi_fu_110_p4) + $signed(11'd2046));

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd5];

always @ (*) begin
    ap_block_pp0 = ((ap_ST_fsm_pp0_stage0 == ap_CS_fsm) & (1'b1 == ap_block_pp0_stage0_subdone));
end

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_enable_operation_31 = (icmp_ln9_fu_138_p2 == 1'd0);
end

always @ (*) begin
    ap_enable_operation_33 = (icmp_ln9_reg_215 == 1'd0);
end

always @ (*) begin
    ap_enable_operation_40 = (icmp_ln9_reg_215_pp0_iter1_reg == 1'd0);
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

always @ (*) begin
    ap_enable_state5_pp0_iter0_stage0 = ((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_enable_state6_pp0_iter1_stage0 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_enable_state7_pp0_iter2_stage0 = ((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1));
end

assign array_r_d0 = (elem2_reg_194 + accum_0_reg_96);

assign i_fu_155_p2 = (ap_phi_mux_i_0_phi_fu_110_p4 + 11'd1);

assign icmp_ln9_fu_138_p2 = ((ap_phi_mux_i_0_phi_fu_110_p4 == 11'd1024) ? 1'b1 : 1'b0);

assign mul_ln12_fu_172_p2 = ($signed(reg_128) * $signed(prev_0_reg_118));

assign prev_1_fu_161_p2 = (elem2_reg_194 + accum_0_reg_96);

assign zext_ln11_fu_167_p1 = i_0_reg_106_pp0_iter1_reg;

assign zext_ln12_fu_150_p1 = add_ln12_fu_144_p2;

endmodule //kernel2
