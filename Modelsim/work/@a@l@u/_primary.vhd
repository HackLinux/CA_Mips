library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        opcode          : in     vl_logic_vector(5 downto 0);
        funct           : in     vl_logic_vector(5 downto 0);
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        ALUResult       : out    vl_logic_vector(31 downto 0);
        zero            : out    vl_logic
    );
end ALU;
