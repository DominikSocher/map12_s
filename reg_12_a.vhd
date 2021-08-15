--------------------------------------------------
-- 12 bit register
-------------------------------------------------
library ieee;
use ieee.std_logic_1164.all; 

entity reg_12_a is
    port (
        d   : in  std_logic_vector(11 downto 0);
        q   : out std_logic_vector(11 downto 0);
        ce  : in  std_logic;
        clk : in  std_logic;
        clr : in  std_logic       
    );
end entity reg_12_a;

architecture rtl of reg_12_a is
    
begin
    
    
    
end architecture rtl;