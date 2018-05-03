LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY full_adder_tb IS
END full_adder_tb;
 
ARCHITECTURE behavior OF full_adder_tb IS 
   
    COMPONENT full_adder
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
			  CI: in  STD_LOGIC;
           CO: out  STD_LOGIC;
           S : out  STD_LOGIC);
    END COMPONENT;
	 
   	signal         A :   STD_LOGIC;
    	signal         B :   STD_LOGIC;
		signal         CI:   STD_LOGIC;
      signal         CO:   STD_LOGIC;
      signal         S :   STD_LOGIC;
	
BEGIN
-- Instantiate the Unit Under Test (UUT)
   uut: full_adder PORT MAP (
	A=>A,
	B=>B,
	CI=>CI,
   CO=>CO,
   S=>S );


   -- Stimulus process
   stim_proc: process
   begin		
      
	A<= '0'	;
	B<= '0'	;
   CI<= '0';
	wait for 50 ns;	
	A<= '0'	;
	B<= '0'	;
   CI<= '1';
	wait for 50 ns;
	A<= '0'	;
	B<= '1'	;
   CI<= '0';		
	wait for 50 ns;	
	A<= '0'	;
	B<= '1'	;
   CI<= '1';
	wait for 50 ns;
	A<= '1'	;
	B<= '0'	;
   CI<= '0';		
	wait for 50 ns;	
	A<= '1'	;
	B<= '0'	;
   CI<= '1';
	wait for 50 ns;
	A<= '1'	;
	B<= '1'	;
   CI<= '0';		
	wait for 50 ns;	
	A<= '1'	;
	B<= '1'	;
   CI<= '1';
   wait;
   end process;

END;
