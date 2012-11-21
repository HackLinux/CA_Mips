library verilog;
use verilog.vl_types.all;
entity reg3232 is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        addr1           : in     vl_logic_vector(4 downto 0);
        addr2           : in     vl_logic_vector(4 downto 0);
        inputData       : in     vl_logic_vector(31 downto 0);
        w_enable        : in     vl_logic;
        addr_w          : in     vl_logic_vector(4 downto 0);
        result1         : out    vl_logic_vector(31 downto 0);
        result2         : out    vl_logic_vector(31 downto 0)
    );
end reg3232;
