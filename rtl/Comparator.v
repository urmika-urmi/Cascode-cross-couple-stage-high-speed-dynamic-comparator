// Cascode Cross-Coupled High-Speed Dynamic Comparator
// Technology: 65nm CMOS (Behavioral Model in Verilog)
// Author: Urmi
// Description: This module models a high-speed comparator using cascode cross-coupled architecture.
// It includes precharge and evaluation phases to mimic dynamic behavior.

module comparator (
    input  wire clk,       // Clock signal
    input  wire rst_n,     // Asynchronous reset (active low)
    input  wire vin_p,     // Positive input
    input  wire vin_n,     // Negative input
    output reg  decision   // Comparator output
);

    // State encoding
    typedef enum reg [1:0] {
        IDLE     = 2'b00,
        PRECHARGE= 2'b01,
        EVALUATE = 2'b10
    } state_t;

    state_t state;

    // Internal signals
    reg precharge;
    reg eval;

    // State machine for precharge and evaluation phases
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= IDLE;
        else begin
            case (state)
                IDLE: state <= PRECHARGE;
                PRECHARGE: state <= EVALUATE;
                EVALUATE: state <= PRECHARGE;
                default: state <= IDLE;
            endcase
        end
    end

    // Generate control signals
    always @(*) begin
        precharge = (state == PRECHARGE);
        eval = (state == EVALUATE);
    end

    // Comparator logic with precharge and evaluation phases
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            decision <= 0;
        else if (precharge)
            decision <= 0; // Reset output during precharge
        else if (eval) begin
            if (vin_p > vin_n)
                decision <= 1;
            else
                decision <= 0;
        end
    end

endmodule