library verilog;
use verilog.vl_types.all;
entity add_4 is
    generic(
        SIZE            : integer := 4
    );
    port(
        x1              : in     vl_logic_vector;
        x2              : in     vl_logic_vector;
        c_in            : in     vl_logic;
        r               : out    vl_logic_vector;
        c_out           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SIZE : constant is 1;
end add_4;
