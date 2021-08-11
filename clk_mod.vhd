-------------------------------------
-- taktgeber
-------------------------------------
library ieee;
use ieee.std_logic_1164.all; 

entity clk_mod is
    port(
        clk   : in std_logic;
        clr   : in std_logic;
        clk_1 : out std_logic;
        clk_2 : out std_logic;
        clk_3 : out std_logic
    );
end clk_mod;

architecture rtl of clk_mod is

   -- signal 

begin

end rtl ; -- rtl