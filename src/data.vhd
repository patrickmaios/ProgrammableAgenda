library ieee;
use ieee.std_logic_1164;
use ieee.std_logic_unsigned;

entity data is
	port(clk , rst, ctrl:in bit;
	an_i, luna_i, zi_i: in integer;
	an_o, luna_o, zi_o: out integer;
	inc_zi:in bit);
end entity;

architecture info of data is
signal an, luna, zi:integer;
signal ok:integer:=1;

begin
	
	process(clk, rst, ctrl)
	begin
		if ok=1 then
		an<=2000;
		luna<=1;
		zi<=1;
		ok<=0;
		end if;
		
	if rst='1' then
		
		an<=2000;
		luna<=1;
		zi<=1;
		
	elsif ctrl='1' then
		
		an<=an_i;
		luna<=luna_i;
		zi<=zi_i;
		
	elsif (clk='1' and clk'event and inc_zi='1') then
		zi<=zi+1;
		
		
		if (luna=1 or luna=3 or luna=5 or luna=7 or luna=8 or luna=10) then
			if zi>30 then 
				
				zi<=1;
				luna<=luna+1;
				
				
			end if;
		elsif luna=2 then
			if (an mod 4)=0 then 
				if zi>29 then
					zi<=1;
					luna<=luna+1;
					
				end if;
			end if;
			if zi>27 then
				zi<=1;
				luna<=luna+1;
				
			end if;
		elsif luna=12 then
			if zi>30 then 
				zi<=1;
				luna<=1;
				
				an<=an+1;
			end if;	
		else
			if zi>29 then 
				zi<=1;
				luna<=luna+1;
				
			end if;
			
		end if;	
		
	end if;	
	
	end process;
	
	an_o<=an;
	luna_o<=luna;
	zi_o<=zi;
	
end architecture;	