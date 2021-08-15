--------------------------------------------------
-- Multiplexer 4:1
-------------------------------------------------
library ieee;
use ieee.std_logic_1164.all; 

entity mux4 is
    port (
        sel     : in  std_logic_vector(1 downto 0);
        mux_out : out std_logic_vector(11 downto 0);
        a       : in  std_logic_vector(11 downto 0);
        b       : in  std_logic_vector(11 downto 0);
        c       : in  std_logic_vector(11 downto 0);
        d       : in  std_logic_vector(11 downto 0)    
    );
end entity mux4;

architecture rtl of mux4 is
    
begin
    
    
    
end architecture rtl;