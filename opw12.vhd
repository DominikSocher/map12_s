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

   -- signal 

begin

end rtl; -- rtl