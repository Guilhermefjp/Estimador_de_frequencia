library verilog;
use verilog.vl_types.all;
entity top_level is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        entrada         : in     vl_logic_vector(31 downto 0);
        amostra_pronta  : in     vl_logic;
        flag            : out    vl_logic;
        ctrl            : out    vl_logic;
        cnt             : out    vl_logic_vector(15 downto 0)
    );
end top_level;
