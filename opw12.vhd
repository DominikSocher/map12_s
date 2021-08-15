--------------------------------------------------
-- 12 bit operationswerk
-------------------------------------------------
library ieee;
use ieee.std_logic_1164.all; 

entity opw12 is
    port(
        mr_d   : in    std_logic_vector(11 downto 0);
        ipr_d  : in    std_logic_vector(11 downto 0);
        ar_q   : out   std_logic_vector(11 downto 0);
        ir_q   : out   std_logic_vector(4  downto 0);
        opr_q  : out   std_logic_vector(11 downto 0);
        sysbus : inout std_logic_vector(11 downto 0);
        a      : in    std_logic_vector(16 downto 0);
        clk    : in    std_logic;
        clr    : in    std_logic;
        op_c   : out   std_logic;
        op_s   : out   std_logic;
        op_z   : out   std_logic
    );
end opw12;

architecture rtl of opw12 is
---------------------------------------------------------
-- Component declaration
---------------------------------------------------------
    component pc12_1 --12 bit programcounter
        port(   
            q   : inout std_logic_vector(11 downto 0);
            d   : in    std_logic_vector(11 downto 0);
            clk : in    std_logic;
            c1  : in    std_logic;
            c2  : in    std_logic;
            clr : in    std_logic
        );
    end component;
--------------------------------------------------------
    component mux2 --multiplexer 2:1
        port( 
            mux_out : out std_logic_vector(11 downto 0);
            a       : in  std_logic_vector(11 downto 0);
            b       : in  std_logic_vector(11 downto 0);
            sel     : in  std_logic
        );
    end component;
---------------------------------------------------------
    component akku_12 --12-bit akkumulator
        port( 
            b    : in  std_logic_vector(11 downto 0);
            q    : out std_logic_vector(11 downto 0);
            cin  : in  std_logic;
            clk  : in  std_logic;
            clr  : in  std_logic;
            s0   : in  std_logic;
            s1   : in  std_logic;
            s2   : in  std_logic;
            op_c : out std_logic;
            op_s : out std_logic;
            op_z : out std_logic
        );
    end component;
------------------------------------------------------------
    component stack_12 --12 -bit register stack
        port( 
            d   : in  std_logic_vector(11 downto 0);
            q   : out std_logic_vector(11 downto 0);
            clk : in  std_logic;
            clr : in  std_logic;
            sel : in  std_logic;
            ce  : in  std_logic
        );
    end component;
-----------------------------------------------------------
    component reg_12_a --12-bit register
        port(
            d   : in  std_logic_vector(11 downto 0);
            q   : out std_logic_vector(11 downto 0);
            ce  : in  std_logic;
            clk : in  std_logic;
            clr : in  std_logic
        );
    end component;
------------------------------------------------------------
    component tbuf_12 --tri state-buffer
        port(
            d    : in  std_logic_vector(11 downto 0);
            q    : out std_logic_vector(11 downto 0);
            en_n : in  std_logic --active low
        );
    end component;
------------------------------------------------------------
    component or_4 --or gate
        port(
            i0 : in  std_logic;
            i1 : in  std_logic;
            i2 : in  std_logic;
            i3 : in  std_logic;
            q  : out std_logic 
        );
    end component;
------------------------------------------------------------
    component inv_a -- inverter
        port(
            i : in  std_logic;
            q : out std_logic
        );
    end component;
------------------------------------------------------------
    component mux4 --multiplexer 4:1
        port(
            sel     : in  std_logic_vector(1 downto 0);
            mux_out : out std_logic_vector(11 downto 0);
            a       : in  std_logic_vector(11 downto 0);
            b       : in  std_logic_vector(11 downto 0);
            c       : in  std_logic_vector(11 downto 0);
            d       : in  std_logic_vector(11 downto 0)
        );
    end component;
------------------------------------------------------------
    component reg5 -- 5-bit register
        port(
            d   : in  std_logic_vector(4 downto 0);
            q   : out std_logic_vector(4 downto 0);
            ce  : in  std_logic;
            clk : in  std_logic;
            clr : in  std_logic
        );
    end component;
------------------------------------------------------------
-- Signal declaration
------------------------------------------------------------
    signal in_tb_s   : std_logic;
    signal in1_tb_s  : std_logic;
    signal gnd_l_s   : std_logic;
    signal gnd5_v_s  : std_logic_vector(4 downto 0);
    signal mux_out_s : std_logic_vector(11 downto 0);
    signal st_q_s    : std_logic_vector(11 downto 0);
    signal pc_q_s    : std_logic_vector(11 downto 0);
    signal a_q_s     : std_logic_vector(11 downto 0);
    signal mr_q_s    : std_logic_vector(11 downto 0);
    signal ipr_q_s   : std_logic_vector(11 downto 0);
    signal ar_s      : std_logic_vector(11 downto 0);
    signal mux_1_t_s : std_logic_vector(11 downto 0);

begin

------------------------------------------------------------
-- Signal assignments
------------------------------------------------------------
    gnd_l_s  <= '0';     --1-bit ground
    gnd5_v_s <= "00000"; --5-bit ground
------------------------------------------------------------
-- Component instances
------------------------------------------------------------
    pc_inst : pc12_1 
    port map(
        q   => pc_q_s,
        d   => mux_out_s,
        clk => clk,
        c1  => a(2),
        c2  => a(1),
        clr => clr
    );

    mux_2_inst : mux2
    port map( 
        mux_out => ar_s,
        a       => sysbus,
        b       => pc_q_s,
        sel     => a(5)
    );

    akk_12_inst : akku_12
    port map(
        b    => sysbus,
        q    => a_q_s,
        cin  => gnd_l_s,
        clk  => clk,
        clr  => clr,
        s0   => a(14),
        s1   => a(15),
        s2   => a(16),
        op_c => op_c,
        op_s => op_s,
        op_z => op_z
    );

    stack_12_inst : stack_12
    port map(
        d   => pc_q_s,
        q   => st_q_s,
        clk => clk,
        clr => clr,
        sel => a(4),
        ce  => a(3)
    );

    mux_2_b_inst : mux2
    port map( 
        mux_out => mux_out_s,
        a       => sysbus,
        b       => st_q_s,
        sel     => a(0)
    );

    reg_12_inst : reg_12_a --12 bit address register ipr
    port map(
        d   => ar_s,
        q   => ar_q,
        ce  => a(6),
        clk => clk,
        clr => clr
    );

    reg_12_b_inst : reg_12_a --12 bit input register ipr
    port map(
        d   => ipr_d,
        q   => ipr_q_s,
        ce  => a(11),
        clk => clk,
        clr => clr
    );

    reg_12_c_inst : reg_12_a -- 12 bit memory register mr
    port map(
        d   => mr_d,
        q   => mr_q_s,
        ce  => a(7),
        clk => clk,
        clr => clr
    );

    reg_12_d_inst : reg_12_a --12 bit output register opr
    port map(
        d   => sysbus,
        q   => opr_q,
        ce  => a(10),
        clk => clk,
        clr => clr
    );

    tbuf_inst : tbuf_12
    port map(
        d    => mux_1_t_s,
        q    => sysbus,
        en_n => in1_tb_s --active low
    );

    inv_inst : inv_a -- inverter tri state buffer
    port map(
        i => in_tb_s,
        q => in1_tb_s
    );

    or_4_inst : or_4
    port map(
        i0 => a(11),
        i1 => a(8),
        i2 => a(9),
        i3 => a(12),
        q  => in_tb_s
    );

    mux_4_inst : mux4
    port map(
        sel(1)         => a(9),
        sel(0)         => a(8),
        mux_out        => mux_1_t_s,
        a              => ipr_q_s,
        b              => a_q_s,
        c(11 downto 7) => gnd5_v_s,
        c(6 downto 0)  => mr_q_s (6 downto 0),
        d              => mr_q_s
    );

    reg_12_e_inst : reg5 --5 bit instruction register ir
    port map(
        d(4 downto 0) => mr_q_s(11 downto 7 ),
        q             => ir_q,
        ce            => a(12),
        clk           => clk,
        clr           => clr
    );




end rtl; -- rtl