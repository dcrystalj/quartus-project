library verilog;
use verilog.vl_types.all;
entity half_adder is
    port(
        x1              : in     vl_logic;
        x2              : in     vl_logic;
        c               : out    vl_logic;
        r               : out    vl_logic
    );
end half_adder;
