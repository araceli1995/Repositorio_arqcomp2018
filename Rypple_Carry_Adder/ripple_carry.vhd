library ieee;
use ieee.std_logic_1164.all;
 
entity ripple_carry is
  generic (
    g_WIDTH : integer := 8
    );
  port (
    i_add_term1  : in std_logic_vector(g_WIDTH-1 downto 0);
    i_add_term2  : in std_logic_vector(g_WIDTH-1 downto 0);
	 ci_add  	  : in std_logic;
	 co_add       : out std_logic;
    o_result     : out std_logic_vector(g_WIDTH-1 downto 0)
    );
end ripple_carry;
 
 
architecture rtl of ripple_carry is
 
component full_adder is
    port (
      A  : in  std_logic;
      B  : in  std_logic;
      CI : in  std_logic;
      S   : out std_logic;
      CO : out std_logic
		);
end component full_adder;
 
  signal w_CARRY : std_logic_vector(g_WIDTH downto 0);
  signal w_SUM   : std_logic_vector(g_WIDTH-1 downto 0);
 
   
begin
  w_CARRY(0)<=ci_add;
  co_add<=w_CARRY(g_WIDTH);
  --w_CARRY(0) <= '0';                    -- no carry input on first full adder
  --o_result(g_WIDTH)<=w_CARRY(g_WIDTH);
  
  SET_WIDTH : for ii in 0 to g_WIDTH-1 generate
    full_adder1 : full_adder port map (
        A  => i_add_term1(ii),
        B  => i_add_term2(ii),
        CI => w_CARRY(ii),
        S   => w_SUM(ii),
        CO => w_CARRY(ii+1)
        );
  end generate SET_WIDTH;
  o_result <=w_SUM;
 
  --o_result <= w_CARRY(g_WIDTH) & w_SUM;  -- VHDL Concatenation
   
end rtl;