-------------------------
-- RAM
-------------------------
library ieee;
use ieee.std_logic_1164.all; 

entity ram12 is
    port(
        do   : out std_logic_vector(11 downto 0);
        di   : in  std_logic_vector(11 downto 0);
        addr : in  std_logic_vector(6  downto 0);
        we   : in  std_logic;
        load : in  std_logic;
        clk  : in  std_logic
    );
end ram12;

architecture rtl of ram12 is

   -- signal 

begin

end rtl; -- rtl
