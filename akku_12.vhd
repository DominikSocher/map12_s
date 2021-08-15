--------------------------------------------------
-- 12 bit akkumulator
-------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity akku_12 is
    port (
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
end entity akku_12;

architecture rtl of akku_12 is
    
begin
    
    
    
end architecture rtl;