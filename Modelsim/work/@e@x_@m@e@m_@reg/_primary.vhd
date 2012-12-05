library verilog;
use verilog.vl_types.all;
entity EX_MEM_Reg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        RegWrite        : in     vl_logic;
        MemtoReg        : in     vl_logic;
        Branch          : in     vl_logic;
        MemRead         : in     vl_logic;
        MemWrite        : in     vl_logic;
        address         : in     vl_logic_vector(31 downto 0);
        ALUResult       : in     vl_logic_vector(31 downto 0);
        zero            : in     vl_logic;
        WriteData       : in     vl_logic_vector(31 downto 0);
        RegWriteAdd     : in     vl_logic_vector(4 downto 0);
        RegWrite_Out    : out    vl_logic;
        MemtoReg_Out    : out    vl_logic;
        Branch_Out      : out    vl_logic;
        MemRead_Out     : out    vl_logic;
        MemWrite_Out    : out    vl_logic;
        address_Out     : out    vl_logic_vector(31 downto 0);
        ALUResult_Out   : out    vl_logic_vector(31 downto 0);
        zero_Out        : out    vl_logic;
        WriteData_Out   : out    vl_logic_vector(31 downto 0);
        RegWriteAdd_Out : out    vl_logic_vector(4 downto 0)
    );
end EX_MEM_Reg;
