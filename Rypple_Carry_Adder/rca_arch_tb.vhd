LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY rca_arch_tb IS
END rca_arch_tb;
 
ARCHITECTURE behavior OF rca_arch_tb IS 
   
component ripple_carry is
 generic (
 g_WIDTH : integer :=8
 );
 port (
	 i_add_term1 : in std_logic_vector(g_WIDTH - 1 downto 0);
	 i_add_term2 : in std_logic_vector(g_WIDTH - 1 downto 0);
	 ci_add : in std_logic;
	 o_result  : out std_logic_vector(g_WIDTH - 1 downto 0);
	 co_add: out std_logic
	 );

end component;

constant g_WIDTH: integer:=8;	 
signal i_add_term1 : std_logic_vector(g_WIDTH - 1 downto 0);
signal i_add_term2 : std_logic_vector(g_WIDTH - 1 downto 0);
signal ci_add : std_logic;
signal o_result : std_logic_vector(g_WIDTH - 1 downto 0);
signal co_add : std_logic;
	
BEGIN
-- Instantiate the Unit Under Test (UUT)
   uut: ripple_carry 
PORT MAP (
		 i_add_term1 => i_add_term1,
		 i_add_term2 => i_add_term2,
		 ci_add => ci_add,
		 o_result => o_result,
		 co_add => co_add
		 );


   -- Stimulus process
   stim_proc: process
   begin		
      
	i_add_term1<= "00000000";
	i_add_term2<= "00000000";
   ci_add<= '0';
	wait for 50 ns;	
	i_add_term1<= "11111111";
	i_add_term2<= "00000000";
   ci_add<= '1';
	wait for 50 ns;
	i_add_term1<= "11111111";
	i_add_term2<= "11111111";
   ci_add<= '0';		
	wait for 50 ns;	
	i_add_term1<= "11110000";
	i_add_term2<= "00001111";
   ci_add<= '1';
	wait for 50 ns;
	i_add_term1<= "00000001";
	i_add_term2<= "00000000";
   ci_add<= '0';		
	wait for 50 ns;	
	i_add_term1<= "00001111";
	i_add_term2<= "00001111";
   ci_add<= '1';
	wait for 50 ns;
	i_add_term1<= "00001110";
	i_add_term2<= "00001111";
   ci_add<= '0';		
	wait for 50 ns;	
	i_add_term1<= "00011110";
	i_add_term2<= "11110000";
   ci_add<= '1';
   wait;
   end process;

END;