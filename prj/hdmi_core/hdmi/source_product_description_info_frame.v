module source_product_description_info_frame (
	header,
	sub
);
	parameter [63:0] VENDOR_NAME = 0;
	parameter [127:0] PRODUCT_DESCRIPTION = 0;
	parameter [7:0] SOURCE_DEVICE_INFORMATION = 0;
	output wire [23:0] header;
	output wire [223:0] sub;
	localparam [4:0] LENGTH = 5'd25;
	localparam [7:0] VERSION = 8'd1;
	localparam [6:0] TYPE = 7'd3;
	assign header = {3'b000, LENGTH, VERSION, 1'b1, TYPE};
	wire [7:0] packet_bytes [27:0];
	assign packet_bytes[0] = 8'd1 + ~((((((((((((((((((((((((((header[23:16] + header[15:8]) + header[7:0]) + packet_bytes[24]) + packet_bytes[23]) + packet_bytes[22]) + packet_bytes[21]) + packet_bytes[20]) + packet_bytes[19]) + packet_bytes[18]) + packet_bytes[17]) + packet_bytes[16]) + packet_bytes[15]) + packet_bytes[14]) + packet_bytes[13]) + packet_bytes[12]) + packet_bytes[11]) + packet_bytes[10]) + packet_bytes[9]) + packet_bytes[8]) + packet_bytes[7]) + packet_bytes[6]) + packet_bytes[5]) + packet_bytes[4]) + packet_bytes[3]) + packet_bytes[2]) + packet_bytes[1]);
	wire signed [7:0] vendor_name [0:7];
	wire signed [7:0] product_description [0:15];
	genvar _gv_i_1;
	generate
		for (_gv_i_1 = 0; _gv_i_1 < 8; _gv_i_1 = _gv_i_1 + 1) begin : vendor_to_bytes
			localparam i = _gv_i_1;
			assign vendor_name[i] = VENDOR_NAME[((8 - i) * 8) - 1:(7 - i) * 8];
		end
		for (_gv_i_1 = 0; _gv_i_1 < 16; _gv_i_1 = _gv_i_1 + 1) begin : product_to_bytes
			localparam i = _gv_i_1;
			assign product_description[i] = PRODUCT_DESCRIPTION[((16 - i) * 8) - 1:(15 - i) * 8];
		end
		for (_gv_i_1 = 1; _gv_i_1 < 9; _gv_i_1 = _gv_i_1 + 1) begin : pb_vendor
			localparam i = _gv_i_1;
			assign packet_bytes[i] = (vendor_name[i - 1] == 8'h30 ? 8'h00 : vendor_name[i - 1]);
		end
		for (_gv_i_1 = 9; _gv_i_1 < LENGTH; _gv_i_1 = _gv_i_1 + 1) begin : pb_product
			localparam i = _gv_i_1;
			assign packet_bytes[i] = (product_description[i - 9] == 8'h30 ? 8'h00 : product_description[i - 9]);
		end
	endgenerate
	assign packet_bytes[LENGTH] = SOURCE_DEVICE_INFORMATION;
	generate
		for (_gv_i_1 = 26; _gv_i_1 < 28; _gv_i_1 = _gv_i_1 + 1) begin : pb_reserved
			localparam i = _gv_i_1;
			assign packet_bytes[i] = 8'd0;
		end
		for (_gv_i_1 = 0; _gv_i_1 < 4; _gv_i_1 = _gv_i_1 + 1) begin : pb_to_sub
			localparam i = _gv_i_1;
			assign sub[i * 56+:56] = {packet_bytes[6 + (i * 7)], packet_bytes[5 + (i * 7)], packet_bytes[4 + (i * 7)], packet_bytes[3 + (i * 7)], packet_bytes[2 + (i * 7)], packet_bytes[1 + (i * 7)], packet_bytes[0 + (i * 7)]};
		end
	endgenerate
endmodule
