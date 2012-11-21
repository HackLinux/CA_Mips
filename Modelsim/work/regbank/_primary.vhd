library verilog;
use verilog.vl_types.all;
entity regbank is
    port(
        r0Addr          : in     vl_logic_vector(4 downto 0);
        r1Addr          : in     vl_logic_vector(4 downto 0);
        wAddr           : in     vl_logic_vector(4 downto 0);
        wData           : in     vl_logic_vector(31 downto 0);
        wEn             : in     vl_logic;
        r0Out           : out    vl_logic_vector(31 downto 0);
        r1Out           : out    vl_logic_vector(31 downto 0);
        CLK             : in     vl_logic;
        reset           : in     vl_logic
    );
end regbank;
