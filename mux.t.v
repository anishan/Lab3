`include "mux.v"

/*This tests that the muxes are implemented correctly. */

module quicktest();
    reg input1;
    reg input2;
    reg selector;
    wire out;
    reg dutpassed = 0;

    mux2to1 muxie (input1, input2, selector, out);

    initial begin

        input1 = 0;
        input2 = 1;
        selector = 1;
        #100
        if (out == 1) begin
            dutpassed = 1;
        end
        else begin
            dutpassed =0;
        end
        input1 = 0;
        input2 = 1;
        selector = 0;
        #100
        if (out == 0) begin
            dutpassed = 1;
        end
        else begin
            dutpassed =0;
        end
        $display("Mux 2 to 1 DUT passed: %b", dutpassed);
    end
endmodule

module quick_5();
reg [4:0] input1;
reg [4:0] input2;
reg selector;
wire [4:0] out;
reg dutpassed = 0;

mux2to15bits muxie5 (input1, input2, selector, out);
initial begin
    input1 = 01001;
    input2 = 11111;
    selector = 1;
    #100
    $display("Output: %b %b %b %b", out, selector, input1, input2);
    if (out == 11111) begin
        dutpassed = 1;
    end
    else begin
        dutpassed =0;
    end

    input1 = 01001;
    input2 = 11111;
    selector = 0;
    #100
    $display("Output: %b %b %b %b", out, selector, input1, input2);
    if (out == 01001) begin
        dutpassed = 1;
    end
    else begin
        dutpassed =0;
    end
    $display("Mux 2 to 1 5 bits DUT passed : %b", dutpassed);
end
endmodule
