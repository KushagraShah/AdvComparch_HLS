-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
-- Version: 2019.2
-- Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity kernel2 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    array_r_address0 : OUT STD_LOGIC_VECTOR (9 downto 0);
    array_r_ce0 : OUT STD_LOGIC;
    array_r_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    array_r_address1 : OUT STD_LOGIC_VECTOR (9 downto 0);
    array_r_ce1 : OUT STD_LOGIC;
    array_r_we1 : OUT STD_LOGIC;
    array_r_d1 : OUT STD_LOGIC_VECTOR (31 downto 0);
    array_r_q1 : IN STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of kernel2 is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "kernel2,hls_ip_2019_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7k160t-fbg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=8.365000,HLS_SYN_LAT=2046,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=6,HLS_SYN_FF=159,HLS_SYN_LUT=327,HLS_VERSION=2019_2}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (5 downto 0) := "000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (5 downto 0) := "000100";
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (5 downto 0) := "001000";
    constant ap_ST_fsm_pp0_stage1 : STD_LOGIC_VECTOR (5 downto 0) := "010000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (5 downto 0) := "100000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv11_3 : STD_LOGIC_VECTOR (10 downto 0) := "00000000011";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv64_1 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000001";
    constant ap_const_lv64_2 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000010";
    constant ap_const_lv11_400 : STD_LOGIC_VECTOR (10 downto 0) := "10000000000";
    constant ap_const_lv11_7FF : STD_LOGIC_VECTOR (10 downto 0) := "11111111111";
    constant ap_const_lv11_7FE : STD_LOGIC_VECTOR (10 downto 0) := "11111111110";
    constant ap_const_lv11_1 : STD_LOGIC_VECTOR (10 downto 0) := "00000000001";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal accum_0_reg_106 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_0_reg_116 : STD_LOGIC_VECTOR (10 downto 0);
    signal reg_128 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal reg_132 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_pp0_stage1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage1 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC := '0';
    signal ap_block_state5_pp0_stage1_iter0 : BOOLEAN;
    signal ap_block_pp0_stage1_11001 : BOOLEAN;
    signal icmp_ln9_reg_219 : STD_LOGIC_VECTOR (0 downto 0);
    signal accum_fu_136_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln9_fu_142_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_block_state4_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state6_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal array_load_4_reg_233 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_fu_182_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal i_reg_238 : STD_LOGIC_VECTOR (10 downto 0);
    signal accum_1_fu_193_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_condition_pp0_exit_iter0_state4 : STD_LOGIC;
    signal ap_block_pp0_stage1_subdone : BOOLEAN;
    signal ap_phi_mux_i_0_phi_fu_120_p4 : STD_LOGIC_VECTOR (10 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal zext_ln12_fu_154_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln12_1_fu_165_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln11_fu_177_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage1 : BOOLEAN;
    signal add_ln12_fu_148_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal add_ln12_1_fu_159_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal add_ln11_fu_170_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul_ln12_fu_188_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state7 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state7 : signal is "none";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_block_pp0 : BOOLEAN;
    signal ap_enable_operation_37 : BOOLEAN;
    signal ap_enable_state5_pp0_iter0_stage1 : BOOLEAN;
    signal ap_enable_operation_29 : BOOLEAN;
    signal ap_enable_state4_pp0_iter0_stage0 : BOOLEAN;
    signal ap_enable_operation_38 : BOOLEAN;
    signal ap_enable_operation_33 : BOOLEAN;
    signal ap_enable_operation_39 : BOOLEAN;
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;


begin




    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_logic_1 = ap_condition_pp0_exit_iter0_state4) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
                elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) or ((ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_const_boolean_0 = ap_block_pp0_stage1_subdone)))) then 
                    ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    accum_0_reg_106_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln9_reg_219 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                accum_0_reg_106 <= accum_1_fu_193_p2;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
                accum_0_reg_106 <= accum_fu_136_p2;
            end if; 
        end if;
    end process;

    i_0_reg_116_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln9_reg_219 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                i_0_reg_116 <= i_reg_238;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
                i_0_reg_116 <= ap_const_lv11_3;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln9_reg_219 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then
                array_load_4_reg_233 <= array_r_q0;
                i_reg_238 <= i_fu_182_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                icmp_ln9_reg_219 <= icmp_ln9_fu_142_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state3) or (ap_const_logic_1 = ap_CS_fsm_state2))) then
                reg_128 <= array_r_q0;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state2) or ((icmp_ln9_reg_219 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1)))) then
                reg_132 <= array_r_q1;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_enable_reg_pp0_iter0, icmp_ln9_fu_142_p2, ap_block_pp0_stage0_subdone, ap_block_pp0_stage1_subdone)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                ap_NS_fsm <= ap_ST_fsm_state3;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when ap_ST_fsm_pp0_stage0 => 
                if ((not(((icmp_ln9_fu_142_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                elsif (((icmp_ln9_fu_142_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then
                    ap_NS_fsm <= ap_ST_fsm_state7;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_pp0_stage1 => 
                if ((ap_const_boolean_0 = ap_block_pp0_stage1_subdone)) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                end if;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXXXXX";
        end case;
    end process;
    accum_1_fu_193_p2 <= std_logic_vector(unsigned(mul_ln12_fu_188_p2) + unsigned(accum_0_reg_106));
    accum_fu_136_p2 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(std_logic_vector(signed(reg_132) * signed(reg_128))), 32));
    add_ln11_fu_170_p0 <= reg_128;
    add_ln12_1_fu_159_p2 <= std_logic_vector(unsigned(ap_phi_mux_i_0_phi_fu_120_p4) + unsigned(ap_const_lv11_7FE));
    add_ln12_fu_148_p2 <= std_logic_vector(unsigned(ap_phi_mux_i_0_phi_fu_120_p4) + unsigned(ap_const_lv11_7FF));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(3);
    ap_CS_fsm_pp0_stage1 <= ap_CS_fsm(4);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state7 <= ap_CS_fsm(5);

    ap_block_pp0_assign_proc : process(ap_CS_fsm, ap_block_pp0_stage0_subdone, ap_block_pp0_stage1_subdone)
    begin
                ap_block_pp0 <= (((ap_ST_fsm_pp0_stage0 = ap_CS_fsm) and (ap_const_boolean_1 = ap_block_pp0_stage0_subdone)) or ((ap_ST_fsm_pp0_stage1 = ap_CS_fsm) and (ap_const_boolean_1 = ap_block_pp0_stage1_subdone)));
    end process;

        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state4_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state5_pp0_stage1_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state6_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_pp0_exit_iter0_state4_assign_proc : process(icmp_ln9_fu_142_p2)
    begin
        if ((icmp_ln9_fu_142_p2 = ap_const_lv1_1)) then 
            ap_condition_pp0_exit_iter0_state4 <= ap_const_logic_1;
        else 
            ap_condition_pp0_exit_iter0_state4 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_CS_fsm_state7)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_enable_operation_29_assign_proc : process(icmp_ln9_fu_142_p2)
    begin
                ap_enable_operation_29 <= (icmp_ln9_fu_142_p2 = ap_const_lv1_0);
    end process;


    ap_enable_operation_33_assign_proc : process(icmp_ln9_fu_142_p2)
    begin
                ap_enable_operation_33 <= (icmp_ln9_fu_142_p2 = ap_const_lv1_0);
    end process;


    ap_enable_operation_37_assign_proc : process(icmp_ln9_reg_219)
    begin
                ap_enable_operation_37 <= (icmp_ln9_reg_219 = ap_const_lv1_0);
    end process;


    ap_enable_operation_38_assign_proc : process(icmp_ln9_reg_219)
    begin
                ap_enable_operation_38 <= (icmp_ln9_reg_219 = ap_const_lv1_0);
    end process;


    ap_enable_operation_39_assign_proc : process(icmp_ln9_reg_219)
    begin
                ap_enable_operation_39 <= (icmp_ln9_reg_219 = ap_const_lv1_0);
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_enable_state4_pp0_iter0_stage0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage0)
    begin
                ap_enable_state4_pp0_iter0_stage0 <= ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1));
    end process;


    ap_enable_state5_pp0_iter0_stage1_assign_proc : process(ap_CS_fsm_pp0_stage1, ap_enable_reg_pp0_iter0)
    begin
                ap_enable_state5_pp0_iter0_stage1 <= ((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1));
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter0 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_phi_mux_i_0_phi_fu_120_p4_assign_proc : process(i_0_reg_116, icmp_ln9_reg_219, ap_CS_fsm_pp0_stage0, i_reg_238, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0)
    begin
        if (((icmp_ln9_reg_219 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            ap_phi_mux_i_0_phi_fu_120_p4 <= i_reg_238;
        else 
            ap_phi_mux_i_0_phi_fu_120_p4 <= i_0_reg_116;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state7)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    array_r_address0_assign_proc : process(ap_CS_fsm_state1, ap_CS_fsm_state2, ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, zext_ln12_1_fu_165_p1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            array_r_address0 <= zext_ln12_1_fu_165_p1(10 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            array_r_address0 <= ap_const_lv64_2(10 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            array_r_address0 <= ap_const_lv64_1(10 - 1 downto 0);
        else 
            array_r_address0 <= "XXXXXXXXXX";
        end if; 
    end process;


    array_r_address1_assign_proc : process(ap_CS_fsm_state1, ap_CS_fsm_pp0_stage1, ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, zext_ln12_fu_154_p1, zext_ln11_fu_177_p1, ap_block_pp0_stage1)
    begin
        if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_const_boolean_0 = ap_block_pp0_stage1))) then 
            array_r_address1 <= zext_ln11_fu_177_p1(10 - 1 downto 0);
        elsif (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            array_r_address1 <= zext_ln12_fu_154_p1(10 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            array_r_address1 <= ap_const_lv64_0(10 - 1 downto 0);
        else 
            array_r_address1 <= "XXXXXXXXXX";
        end if; 
    end process;


    array_r_ce0_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state2, ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) or ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1)) or ((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1)))) then 
            array_r_ce0 <= ap_const_logic_1;
        else 
            array_r_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    array_r_ce1_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_pp0_stage1, ap_enable_reg_pp0_iter0, ap_block_pp0_stage1_11001, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if ((((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1)) or ((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1)) or ((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1)))) then 
            array_r_ce1 <= ap_const_logic_1;
        else 
            array_r_ce1 <= ap_const_logic_0;
        end if; 
    end process;

    array_r_d1 <= std_logic_vector(unsigned(add_ln11_fu_170_p0) + unsigned(accum_0_reg_106));

    array_r_we1_assign_proc : process(ap_CS_fsm_pp0_stage1, ap_enable_reg_pp0_iter0, ap_block_pp0_stage1_11001, icmp_ln9_reg_219)
    begin
        if (((icmp_ln9_reg_219 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            array_r_we1 <= ap_const_logic_1;
        else 
            array_r_we1 <= ap_const_logic_0;
        end if; 
    end process;

    i_fu_182_p2 <= std_logic_vector(unsigned(i_0_reg_116) + unsigned(ap_const_lv11_1));
    icmp_ln9_fu_142_p2 <= "1" when (ap_phi_mux_i_0_phi_fu_120_p4 = ap_const_lv11_400) else "0";
    mul_ln12_fu_188_p2 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(std_logic_vector(signed(reg_132) * signed(array_load_4_reg_233))), 32));
    zext_ln11_fu_177_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(i_0_reg_116),64));
    zext_ln12_1_fu_165_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln12_1_fu_159_p2),64));
    zext_ln12_fu_154_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln12_fu_148_p2),64));
end behav;
