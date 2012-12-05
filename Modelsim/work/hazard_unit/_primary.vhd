library verilog;
use verilog.vl_types.all;
entity hazard_unit is
    port(
        IF_ID_RegAdd_RS : in     vl_logic_vector(4 downto 0);
        IF_ID_RegAdd_RT : in     vl_logic_vector(4 downto 0);
        ID_EX_RegWriteAdd: in     vl_logic_vector(4 downto 0);
        ID_EX_MemRead   : in     vl_logic;
        IF_ID_Write     : out    vl_logic;
        PCWrite         : out    vl_logic;
        ID_EX_Mux       : out    vl_logic
    );
end hazard_unit;
