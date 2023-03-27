library ieee;
use ieee.std_logic_1164;
use ieee.std_logic_unsigned;

entity sapte is
	Port(clk, rst, ctrl: in bit;
	sapt_i:in integer;
	sapt_o:out integer;
	inc_zi:in bit);
end entity;

architecture week of sapte is
signal sapt:integer;
signal ok:integer:=1;
begin
	process(clk, rst, ctrl)
	begin
		if ok=1 then
		sapt<=1;
		ok<=0;
		end if;
		if rst='1' then
			sapt<=1;
			
		elsif ctrl='1' then
			sapt<=sapt_i;
		elsif clk'event and clk='1' and inc_zi='1' then
			sapt<=sapt+1;
			if sapt>6 then
				sapt<=1;
			end if;
			
		end if;
		sapt_o<=sapt;
		
		
	end process;
	
	
end architecture;	