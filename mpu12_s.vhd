-------------------------------------------
-- 12 bit Mikroprozessor
-- mr_d muss geänadert werden
-- --
--
-------------------------------------------

library ieee;
use ieee.std_logic_1164.all; 

entity mpu12_s is 
    port(
        opr_q : out std_logic_vector(11 downto 0);
        ipr_d : in  std_logic_vector(11 downto 0);
        clk   : in  std_logic;
        clr   : in  std_logic;
        ipv   : in  std_logic;
        start : in  std_logic;
        load  : in  std_logic;
        oprec : in  std_logic;
        ipreq : out std_logic;
        opv   : out std_logic
    );
end mpu12_s;

architecture rtl of mpu12_s is

--------------------------------------------------------
-- COMPONDENT DECLARATION
--------------------------------------------------------
    component mpu12 --12 Bit Prozessor
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
    end component;

    component ram12
        port(
            do   : out std_logic_vector(11 downto 0);
            di   : in  std_logic_vector(11 downto 0);
            addr : in  std_logic_vector(6  downto 0); 
            we   : in  std_logic;
            load : in  std_logic;
            clk  : in  std_logic
        );
    end component;

    component clk_mod
        port(
            clk   : in std_logic;
            clr   : in std_logic;
            clk_1 : out std_logic;
            clk_2 : out std_logic;
            clk_3 : out std_logic
        );
    end component;




-----------------------------------------------------
-- Signal declaration
-----------------------------------------------------
    signal da_1_s       : std_logic_vector(11 downto 0);
    signal sys_in_s     : std_logic_vector(11 downto 0);
    signal addr_in_s    : std_logic_vector(6 downto 0);
    signal gnd_s        : std_logic_vector(4 downto 0);
    signal wr_in_s      : std_logic;
    signal clk_opw_in_s : std_logic;
    signal clk_stw_in_s : std_logic;
    signal clk_ram_in_s : std_logic;

begin
----------------------------------------------------
-- Signal assignments
----------------------------------------------------
    gnd_s <= (others => '0'); -- 5 bit ground bus

----------------------------------------------------
-- Component instances
----------------------------------------------------
    mpu12_inst : mpu12
        port map(
            mr_d              => da_1_s,
            sysbus            => sys_in_s,
            opr_q             => opr_q,
            ipr_d             => ipr_d,
            ar_q(11 downto 7) => gnd_s,
            ar_q(6  downto 0) => addr_in_s, 
            wr_en             => wr_in_s,
            clr               => clr,
            clk_stw           => clk_stw_in_s,
            clk_opw           => clk_opw_in_s,
            ipv               => ipv,
            ipreq             => ipreq,
            opv               => opv,
            oprec             => oprec,
            start             => start
        );
-------------------------------------------------------
    clk_mod_inst : clk_mod
        port map(
            clk   => clk,
            clr   => clr,
            clk_1 => clk_opw_in_s,
            clk_2 => clk_stw_in_s,
            clk_3 => clk_ram_in_s
        );
-------------------------------------------------------
    ram12_ins : ram12
        port map(
            do   => da_1_s,
            di   => sys_in_s,
            addr => addr_in_s,
            we   => wr_in_s,
            load => load,
            clk  => clk_ram_in_s
        );

end rtl ; -- rtl

