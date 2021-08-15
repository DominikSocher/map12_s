--------------------------------------------------
-- 12 bit programcounter
-------------------------------------------------
library ieee;
use ieee.std_logic_1164.all; 

entity pc12_1 is
    port (
        q   : inout std_logic_vector(11 downto 0);
        d   : in    std_logic_vector(11 downto 0);
        clk : in    std_logic;
        c1  : in    std_logic;
        c2  : in    std_logic;
        clr : in    std_logic     
    );
end entity pc12_1;

architecture rtl of pc12_1 is
    
begin
    
    
    
end architecture rtl;