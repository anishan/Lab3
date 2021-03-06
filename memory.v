// Module to access instruction memory and output a single instruction

module Instr_memory
(
  input[31:0] Addr,
  output [31:0] DataOut
);

  reg [31:0] mem[0:1023]; // Generate array to store data from file

  initial $readmemh("fullMem.dat", mem); // Read memory from file and store in array

  assign DataOut = mem[Addr]; // Output instruction at address Addr
endmodule

// Module to access and modify data memory

module Data_memory
(
  input clk, regWE,
  input[31:0] Addr,
  input[31:0] DataIn,
  output[31:0]  DataOut
);

  reg [31:0] mem[0:1023]; // Generate array to store data from file

  always @(posedge clk) begin // Update array on posedge clock
    if (regWE) begin // Check for write enable
      mem[Addr] <= DataIn;
    end
  end

  always @(negedge clk) begin // Update file on negedge clock
      if (regWE) begin
          $writememh("fullMem.dat", mem); // Write to file
      end
  end

  initial begin
      $readmemh("fullMem.dat", mem); // Initially read file
  end
 
      assign DataOut = mem[Addr]; // Ouptu data at address Addr
endmodule

