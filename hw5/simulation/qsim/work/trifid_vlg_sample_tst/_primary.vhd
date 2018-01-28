library verilog;
use verilog.vl_types.all;
entity trifid_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        crypt           : in     vl_logic;
        data0           : in     vl_logic_vector(7 downto 0);
        data1           : in     vl_logic_vector(7 downto 0);
        data2           : in     vl_logic_vector(7 downto 0);
        data3           : in     vl_logic_vector(7 downto 0);
        data4           : in     vl_logic_vector(7 downto 0);
        data5           : in     vl_logic_vector(7 downto 0);
        data6           : in     vl_logic_vector(7 downto 0);
        data7           : in     vl_logic_vector(7 downto 0);
        data8           : in     vl_logic_vector(7 downto 0);
        data9           : in     vl_logic_vector(7 downto 0);
        data10          : in     vl_logic_vector(7 downto 0);
        data11          : in     vl_logic_vector(7 downto 0);
        data12          : in     vl_logic_vector(7 downto 0);
        data13          : in     vl_logic_vector(7 downto 0);
        data14          : in     vl_logic_vector(7 downto 0);
        data15          : in     vl_logic_vector(7 downto 0);
        data16          : in     vl_logic_vector(7 downto 0);
        data17          : in     vl_logic_vector(7 downto 0);
        ready           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end trifid_vlg_sample_tst;
