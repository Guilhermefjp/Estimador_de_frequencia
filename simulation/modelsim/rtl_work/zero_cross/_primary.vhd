library verilog;
use verilog.vl_types.all;
entity zero_cross is
    port(
        clk             : in     vl_logic;
        enable          : in     vl_logic;
        x               : in     vl_logic_vector(31 downto 0);
        flag            : out    vl_logic
    );
end zero_cross;
