--------------------------------------------------
-- 12 bit operationswerk
-------------------------------------------------
library ieee;
use ieee.std_logic_1164.all; 

entity reg5 is
    port (
        d   : in  std_logic_vector(4 downto 0);
        q   : out std_logic_vector(4 downto 0);
        ce  : in  std_logic;
        clk : in  std_logic;
        clr : in  std_logic      
    );
end entity reg5;

architecture rtl of reg5 is
    
begin
    
    
    
end architecture rtl;