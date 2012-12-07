library verilog;
use verilog.vl_types.all;
entity branch_control is
    port(
        RegData1        : in     vl_logic_vector(31 downto 0);
        RegData2        : in     vl_logic_vector(31 downto 0);
        instruction     : in     vl_logic_vector(31 downto 0);
        address         : in     vl_logic_vector(31 downto 0);
        SignExtend      : in     vl_logic_vector(31 downto 0);
        branch          : in     vl_logic;
        Jump            : in     vl_logic;
        DoBranch        : out    vl_logic;
        BranchAddress   : out    vl_logic_vector(31 downto 0)
    );
end branch_control;
