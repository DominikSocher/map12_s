-----------------
-- PROZESSOR
-----------------
library ieee;
use ieee.std_logic_1164.all; 

entity mpu12 is
    port(
        mr_d    : in    std_logic_vector(11 downto 0);
        sysbus  : inout std_logic_vector(11 downto 0);
        opr_q   : out   std_logic_vector(11 downto 0);
        ipr_d   : in    std_logic_vector(11 downto 0);
        ar_q    : out   std_logic_vector(11 downto 0);
        wr_en   : out   std_logic;
        clr     : in    std_logic;
        clk_stw : in    std_logic;
        clk_opw : in    std_logic;
        ipv     : in    std_logic;
        ipreq   : out   std_logic;
        opv     : out   std_logic;
        oprec   : in    std_logic;
        start   : in    std_logic
    );
end mpu12;

architecture rtl of mpu12 is
--------------------------------------------------
-- Component declaration
--------------------------------------------------
    component stw12 --12bit Steuerwerk
        port(
            a     : out std_logic_vector(16 downto 0);
            opc   : in  std_logic_vector(4  downto 0);
            clr   : in  std_logic;
            clk   : in  std_logic;
            ipv   : in  std_logic;
            op_z  : in  std_logic;
            op_s  : in  std_logic;
            op_c  : in  std_logic;
            ipreq : out std_logic;
            opv   : out std_logic;
            oprec : in  std_logic;
            start : in  std_logic
        );
        end component;
----------------------------------------------------
    component opw12 --12bit Operationswerk
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
        end component;
----------------------------------------------------
-- Signal Declaration
----------------------------------------------------
    signal st_c1_s : std_logic;
    signal st_s1_s : std_logic;
    signal st_z1_s : std_logic;
    signal a_s     : std_logic_vector(16 downto 0); --17bit ansteuervektor
    signal opc_s   : std_logic_vector(4  downto 0);

begin

------------------------------------------------------
-- Signal Assignments
------------------------------------------------------
    wr_en <= a_s(13);
------------------------------------------------------
-- Component Instances
------------------------------------------------------
    stw12_inst : stw12 
    port map(
        a     => a_s,
        opc   => opc_s,
        clr   => clr,
        clk   => clk_stw,
        ipv   => ipv,
        op_z  => st_z1_s,
        op_s  => st_s1_s,
        op_c  => st_c1_s,
        ipreq => ipreq,
        opv   => opv,
        oprec => oprec,
        start => start
    );
-------------------------------------------------------
    opw12_inst : opw12
    port map(
        mr_d   => mr_d,
        ipr_d  => ipr_d,
        ar_q   => ar_q,
        ir_q   => opc_s,
        opr_q  => opr_q,
        sysbus => sysbus,
        a      => a_s,
        clk    => clk_opw,
        clr    => clr,
        op_c   => st_c1_s,
        op_s   => st_s1_s,
        op_z   => st_z1_s
    );

end rtl; --mpu12