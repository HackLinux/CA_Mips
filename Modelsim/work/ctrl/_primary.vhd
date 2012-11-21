library verilog;
use verilog.vl_types.all;
entity ctrl is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        opcode          : in     vl_logic_vector(5 downto 0);
        RegDst          : out    vl_logic;
        Jump            : out    vl_logic;
        Branch          : out    vl_logic;
        MemRead         : out    vl_logic;
        MemtoReg        : out    vl_logic;
        MemWrite        : out    vl_logic;
        ALUsrc          : out    vl_logic;
        RegWrite        : out    vl_logic
    );
end ctrl;
