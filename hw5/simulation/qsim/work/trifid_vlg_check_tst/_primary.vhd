library verilog;
use verilog.vl_types.all;
entity trifid_vlg_check_tst is
    port(
        cipher0         : in     vl_logic_vector(7 downto 0);
        cipher1         : in     vl_logic_vector(7 downto 0);
        cipher2         : in     vl_logic_vector(7 downto 0);
        cipher3         : in     vl_logic_vector(7 downto 0);
        cipher4         : in     vl_logic_vector(7 downto 0);
        cipher5         : in     vl_logic_vector(7 downto 0);
        cipher6         : in     vl_logic_vector(7 downto 0);
        cipher7         : in     vl_logic_vector(7 downto 0);
        cipher8         : in     vl_logic_vector(7 downto 0);
        cipher9         : in     vl_logic_vector(7 downto 0);
        cipher10        : in     vl_logic_vector(7 downto 0);
        cipher11        : in     vl_logic_vector(7 downto 0);
        cipher12        : in     vl_logic_vector(7 downto 0);
        cipher13        : in     vl_logic_vector(7 downto 0);
        cipher14        : in     vl_logic_vector(7 downto 0);
        cipher15        : in     vl_logic_vector(7 downto 0);
        cipher16        : in     vl_logic_vector(7 downto 0);
        cipher17        : in     vl_logic_vector(7 downto 0);
        done            : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end trifid_vlg_check_tst;
