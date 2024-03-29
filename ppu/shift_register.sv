module SIPO_shift_register #(parameter width = 8)
(
    input clk,
	 input shift_en,
    input  in,
	 input reset,
    output logic [width-1:0] out
);


logic [width-1:0] data;

always_ff @(posedge clk or posedge reset)
begin

	 if (reset)
		data = 0;
	 else if(shift_en)
	 begin
		data = { data[6:0],in};
	 end
end

always_comb
begin
    out = data;
end

endmodule


module PISO_shift_register #(parameter width = 8)
(
    input clk,
	 input shift_en, load,
    input  [7:0] in,
	 input reset,
    output logic out
);


logic [width-1:0] data;


always_ff @(posedge clk or posedge reset)
begin

	 if (reset)
		data = 0;
	 else if (load)
		data = in;
	 else if(shift_en)
	 begin
		data = {data[6:0], 1'b0};
	 end
end

always_comb
begin
    out = data[7];
end

endmodule
