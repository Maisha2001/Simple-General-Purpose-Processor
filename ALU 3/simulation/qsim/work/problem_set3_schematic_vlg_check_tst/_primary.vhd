library verilog;
use verilog.vl_types.all;
entity problem_set3_schematic_vlg_check_tst is
    port(
        leds            : in     vl_logic_vector(0 to 6);
        student_id      : in     vl_logic_vector(0 to 6);
        sampler_rx      : in     vl_logic
    );
end problem_set3_schematic_vlg_check_tst;
