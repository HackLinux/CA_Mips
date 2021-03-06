library verilog;
use verilog.vl_types.all;
entity control is
    port(
        opCode          : in     vl_logic_vector(5 downto 0);
        RegDst          : out    vl_logic;
        Jump            : out    vl_logic;
        Branch          : out    vl_logic;
        MemRead         : out    vl_logic;
        MemtoReg        : out    vl_logic;
        MemWrite        : out    vl_logic;
        ALUsrc          : out    vl_logic;
        RegWrite        : out    vl_logic
    );
end control;
