library verilog;
use verilog.vl_types.all;
entity problem_set3_schematic_vlg_sample_tst is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        Clock           : in     vl_logic;
        data_in         : in     vl_logic;
        Enable_Decoder  : in     vl_logic;
        FSM_reset       : in     vl_logic;
        Reset_A         : in     vl_logic;
        Reset_B         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end problem_set3_schematic_vlg_sample_tst;
