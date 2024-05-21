library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ReverseDecryption is
    Generic (
        N : integer := 8  -- Longueur du message
    );
    Port (
        clk        : in  std_logic;
        reset      : in  std_logic;
        enable     : in  std_logic;
        cipher     : in  std_logic_vector(N-1 downto 0);
        message    : out std_logic_vector(N-1 downto 0)
    );
end ReverseDecryption;

architecture Behavioral of ReverseDecryption is
    signal temp_message : std_logic_vector(N-1 downto 0);
begin
    process(clk, reset)
    begin
        if reset = '1' then
            temp_message <= (others => '0');
            message <= (others => '0');
        elsif rising_edge(clk) then
            if enable = '1' then
                for i in 0 to N-1 loop
                    temp_message(i) <= cipher(N-1-i);
                end loop;
                message <= temp_message;
            end if;
        end if;
    end process;
end Behavioral;