--------------------------------------------------
-- 12 bit tri state buffer
-------------------------------------------------
library ieee;
use ieee.std_logic_1164.all; 

entity tbuf_12 is
    port (
        d    : in  std_logic_vector(11 downto 0);
        q    : out std_logic_vector(11 downto 0);
        en_n : in  std_logic --active low      
    );
end entity tbuf_12;

architecture rtl of tbuf_12 is
    
begin
    
    
    
end architecture rtl;