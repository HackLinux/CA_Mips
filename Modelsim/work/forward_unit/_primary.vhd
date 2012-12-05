library verilog;
use verilog.vl_types.all;
entity forward_unit is
    port(
        ID_EX_RS        : in     vl_logic_vector(4 downto 0);
        ID_EX_RT        : in     vl_logic_vector(4 downto 0);
        EX_MEM_RegWriteAdd: in     vl_logic_vector(4 downto 0);
        EX_MEM_RegWrite : in     vl_logic;
        EX_MEM_MemtoReg : in     vl_logic;
        MEM_WB_RegWriteAdd: in     vl_logic_vector(4 downto 0);
        MEM_WB_RegWrite : in     vl_logic;
        MEM_WB_MemtoReg : in     vl_logic;
        ALU_Mux1        : out    vl_logic_vector(1 downto 0);
        ALU_Mux2        : out    vl_logic_vector(1 downto 0)
    );
end forward_unit;
