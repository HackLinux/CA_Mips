library verilog;
use verilog.vl_types.all;
entity mips_cpu_adv is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        instr           : in     vl_logic_vector(31 downto 0);
        data            : in     vl_logic_vector(31 downto 0);
        instr_addr      : out    vl_logic_vector(32 downto 1);
        data_addr       : out    vl_logic_vector(32 downto 1);
        data_in         : out    vl_logic_vector(31 downto 0);
        mem_read        : out    vl_logic;
        mem_write       : out    vl_logic
    );
end mips_cpu_adv;
