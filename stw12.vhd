--------------------------------------------------
-- 12 bit Steuerwerk
-------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity stw12 is
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
end stw12;

architecture rtl of stw12 is

   -- signal 

begin

end rtl; -- rtl