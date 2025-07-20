module div_by_3(
    input  logic clk,
    input  logic reset,
    input  logic x_i,
    
    output logic div_o
    );
    
    // Defining the 3 different states as enum
    typedef enum {REM_0, REM_1, REM_2} state_t;
    
    state_t state_curr; // current state value
    state_t state_next; // next state value
    
    always_ff@(posedge clk)
    begin
        if(reset)
            state_curr <= REM_0;
        else
            state_curr <= state_next;   
    end
    
    always_comb begin
        div_o = 1'b0;
        state_next = state_curr;
        case(state_curr)
            REM_0:
                if(x_i)
                    state_next = REM_1;
                else begin
                    state_next = REM_0;
                    div_o = 1'b1;
                end
            REM_1:
                if(x_i) begin
                    state_next = REM_0;
                    div_o = 1'b1;
                end
                else
                    state_next = REM_2;
            REM_2:
                if(x_i)
                    state_next = REM_2;
                else
                    state_next = REM_1;
            default: state_next = REM_0;
        endcase
    end
endmodule