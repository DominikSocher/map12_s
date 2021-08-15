--------------------------------------------------
-- 12 bit register stack
-------------------------------------------------
library ieee;
use ieee.std_logic_1164.all; 

entity stack_12 is
    port (
        d   : in  std_logic_vector(11 downto 0);
        q   : out std_logic_vector(11 downto 0);
        clk : in  std_logic;
        clr : in  std_logic;
        sel : in  std_logic;
        ce  : in  std_logic      
    );
end entity stack_12;

architecture rtl of stack_12 is
    
begin
    
    
    
end architecture rtl;