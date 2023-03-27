library ieee;
use ieee.std_logic_1164;
use ieee.std_logic_unsigned;

entity vreme is
	Port(clk, rst, ctrl:in bit;
	temp_i:in integer;
	temp_o:out integer);
end entity;

architecture celsius of vreme is
signal temp:integer;
signal timp:integer;
signal ok:integer:=1;
begin
	process(clk, rst, ctrl)
	begin
		if ok=1 then
		temp<=21;
		ok<=0;
		end if;
	
		if rst='1' then
			temp<=0;
		elsif ctrl='1' then
			temp<=temp_i;
		elsif clk'event and clk='1' then
			temp<=temp;
			
		end if;
		
		
	end process;
	temp_o<=temp;
	
end architecture;
