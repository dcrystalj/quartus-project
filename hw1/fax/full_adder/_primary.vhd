library verilog;
use verilog.vl_types.all;
entity full_adder is
    port(
        x1              : in     vl_logic;
        x2              : in     vl_logic;
        c_in            : in     vl_logic;
        c_out           : out    vl_logic;
        r               : out    vl_logic
    );
end full_adder;
