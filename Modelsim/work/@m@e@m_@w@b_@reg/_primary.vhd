library verilog;
use verilog.vl_types.all;
entity MEM_WB_Reg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        RegWrite        : in     vl_logic;
        MemtoReg        : in     vl_logic;
        MemoryData      : in     vl_logic_vector(31 downto 0);
        ALUResult       : in     vl_logic_vector(31 downto 0);
        RegWriteAdd     : in     vl_logic_vector(4 downto 0);
        RegWrite_Out    : out    vl_logic;
        MemtoReg_Out    : out    vl_logic;
        MemoryData_Out  : out    vl_logic_vector(31 downto 0);
        ALUResult_Out   : out    vl_logic_vector(31 downto 0);
        RegWriteAdd_Out : out    vl_logic_vector(4 downto 0)
    );
end MEM_WB_Reg;
