library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ReverseCipher is
    Generic (
        N : integer := 8 
    );
    Port (
        clk     : in  std_logic;
        reset   : in  std_logic;
        enable  : in  std_logic;
        message : in  std_logic_vector(N-1 downto 0);
        cipher  : out std_logic_vector(N-1 downto 0)
    );
end ReverseCipher;
architecture Behavioral of ReverseCipher is
    signal temp_message : std_logic_vector(N-1 downto 0);
begin
    process(clk, reset)
    begin
        if reset = '1' then
            temp_message <= (others => '0');
            cipher <= (others => '0');
        elsif rising_edge(clk) then
            if enable = '1' then
                for i in 0 to N-1 loop
                    temp_message(i) <= message(N-1-i);
                end loop;
                cipher <= temp_message;
            end if;
        end if;
    end process;
end Behavioral;
