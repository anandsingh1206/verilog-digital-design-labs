`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/* -----------------------------------------------------------------------------
 * File        : alu_4bit_tb.v
 * Author      : Anand Singh
 * Date        : April 2026
 * Description :  4-bit Arithmetic Logic Unit (ALU) supporting core arithmetic 
 * and bitwise operations.
 * ----------------------------------------------------------------------------- */
//////////////////////////////////////////////////////////////////////////////////

module alu_4bit_tb;

    reg  [3:0] tb_a, tb_b;
    reg  [1:0] tb_opcode;
    wire [4:0] tb_result;

    // Instantiate the ALU
    alu_4bit uut (
        .a(tb_a),
        .b(tb_b),
        .opcode(tb_opcode),
        .result(tb_result)
    );

    // Task for self-checking
    task check_output;
        input [4:0] expected;
        begin
            #10; // Wait for propagation
            if (tb_result === expected)
                $display("[PASS] A=%b, B=%b, OP=%b | Result=%b", tb_a, tb_b, tb_opcode, tb_result);
            else
                $display("[FAIL] A=%b, B=%b, OP=%b | Expected=%b, Got=%b", tb_a, tb_b, tb_opcode, expected, tb_result);
        end
    endtask

    initial begin
        $display("--- Starting ALU Verification ---");
        
        // Test 1: Addition (8 + 3 = 11)
        tb_a = 4'b1000; tb_b = 4'b0011; tb_opcode = 2'b00;
        check_output(5'b01011);

        // Test 2: Subtraction (10 - 4 = 6)
        tb_a = 4'b1010; tb_b = 4'b0100; tb_opcode = 2'b01;
        check_output(5'b00110);

        // Test 3: Bitwise AND
        tb_a = 4'b1100; tb_b = 4'b1010; tb_opcode = 2'b10;
        check_output(5'b01000);

        $display("--- Verification Complete ---");
        $finish;
    end
endmodule
