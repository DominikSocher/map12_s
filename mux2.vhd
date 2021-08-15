--------------------------------------------------
-- 2:1 mux
-------------------------------------------------
library ieee;
use ieee.std_logic_1164.all; 

entity mux2 is
    port (
        mux_out : out std_logic_vector(11 downto 0);
        a       : in  std_logic_vector(11 downto 0);
        b       : in  std_logic_vector(11 downto 0);
        sel     : in  std_logic      
    );
end entity mux2;

architecture rtl of mux2 is
    
begin
    
    
    
end architecture rtl;