library verilog;
use verilog.vl_types.all;
entity IF_ID_Reg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        IF_ID_Write     : in     vl_logic;
        FlushIt         : in     vl_logic;
        instr_add       : in     vl_logic_vector(31 downto 0);
        instr           : in     vl_logic_vector(31 downto 0);
        address         : out    vl_logic_vector(31 downto 0);
        instruction     : out    vl_logic_vector(31 downto 0)
    );
end IF_ID_Reg;
