library ieee;
    use ieee.std_logic_1164.all;

entity hello_world is
	generic (DEBUG : boolean := false);
	port(dummy : std_logic := '0');
end hello_world;

architecture tb of hello_world is
	
	constant GREETING : string(1 to 12) := "Hello World!";
	type exclaim_t is record
		who  : string(1 to 4);
		says : string(1 to 12);
  end record exclaim_t;
  signal exclaim : exclaim_t;

begin
	
	local : block begin
		stim : process begin
			exclaim <= (
        who  => "Lars",
        says => GREETING
      );
      --report exclaim.who & " says: ";-- & exclaim.says;
      report GREETING;
			for i in 5 downto 0 loop
				report integer'image(i);
				wait for 1 ms;
			end loop;
			report "Goodbye World!" severity warning;
			wait; -- forever
		end process stim;
	end block local;

	bug : block
		signal arr : std_logic_vector(7 downto 0) := x"DB";
		signal x   : std_logic;
	begin
		stim : process begin
			for i in 0 to 8 loop
				x <= arr(i);
				wait for 1 ms;
			end loop;
		end process stim;
	end block bug;

end tb;
