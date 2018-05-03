library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity full_adder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
	   CI: in  STD_LOGIC;
           CO: out  STD_LOGIC;
           S : out  STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is

begin
S<= (A xor B xor CI);
CO <= ((A and B)or(A and CI)or(B and CI));

end Behavioral;
