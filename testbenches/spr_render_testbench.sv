/* Test bench to make sure the VRAM mapper works correctly */

module spr_render_testbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;

// These signals are internal because the processor will be 
// instantiated as a submodule in testbench.
logic clk = 0;	

logic reset;
	logic vram_WE, ppu_reg_cs;
	logic [7:0] cpu_data_in;
	logic [7:0] cpu_data_out;
	logic [2:0] ppu_reg_addr; 
	logic [7:0]  VGA_R,			//VGA Red
					 VGA_G,					//VGA Green
					 VGA_B;					//VGA Blue
 logic  VGA_CLK,				//VGA Clock
					 VGA_SYNC_N,			//VGA Sync signal
					 VGA_BLANK_N,			//VGA Blank signal
					 VGA_VS,					//VGA vertical sync signal	
					 VGA_HS,					//VGA horizontal sync signal
					 NMI_enable;
logic oam_dma;
logic [7:0] oam_addr, oam_data_in;
ppu_toplevel spr(.*);
	
// Toggle the clock
// #1 means wait for a delay of 1 timeunit
always begin : CLOCK_GENERATION
#2 clk = ~clk;

end

initial begin: CLOCK_INITIALIZATIONff
    clk = 0;
end 

// Testing begins here
// The initial block is not synthesizable
// Everything happens sequentially inside an initial block
// as in a software program
initial begin: TEST_VECTORS

#2 reset = 1;

#2 reset = 0;


end
endmodule
