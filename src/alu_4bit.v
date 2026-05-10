`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/* -----------------------------------------------------------------------------
 * File        : alu_4bit.v
 * Author      : Anand Singh
 * Date        : April 2026
 * Description : 4-bit Arithmetic Logic Unit (ALU) supporting core arithmetic 
  * and bitwise operations.
 * ----------------------------------------------------------------------------- */
//////////////////////////////////////////////////////////////////////////////////


module alu_4bit (
    input  wire [3:0] a,
    input  wire [3:0] b,
    input  wire [1:0] opcode,
    output reg  [4:0] result // 5 bits to catch overflow/carry
);

    always @(*) begin
        case (opcode)
            2'b00: result = a + b;       // ADD
            2'b01: result = a - b;       // SUB
            2'b10: result = a & b;       // AND
            2'b11: result = a | b;       // OR
            default: result = 5'b00000;
        endcase
    end
endmodule
