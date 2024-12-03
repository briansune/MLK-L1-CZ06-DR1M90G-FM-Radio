// ==================================================
//  ____         _                ____                      
// | __ )  _ __ (_)  __ _  _ __  / ___|  _   _  _ __    ___ 
// |  _ \ | '__|| | / _` || '_ \ \___ \ | | | || '_ \  / _ \
// | |_) || |   | || (_| || | | | ___) || |_| || | | ||  __/
// |____/ |_|   |_| \__,_||_| |_||____/  \__,_||_| |_| \___|
//                                                          
// Programed By: BrianSune
// Contact: briansune@gmail.com
// 

module del_m(
	
	input aclk,
	input aresetn,
	
	input 	[28 : 0]	tap_i,
	input 	[28 : 0]	tap_q,
	
	output	[15 : 0]	out_i,
	output	[15 : 0]	out_q
);
	
	wire	[15 : 0]	tap_i_w = tap_i[28:13];
	wire	[15 : 0]	tap_q_w = tap_q[28:13];
	
	reg signed		[15 : 0]	delay_i0;
	reg signed		[15 : 0]	delay_q0;
	
	reg signed		[15 : 0]	delay_i1;
	reg signed		[15 : 0]	delay_q1;
	
	always@(posedge aclk or negedge aresetn)begin
		if(!aresetn)begin
			delay_i0 <= 16'd0;
			delay_i1 <= 16'd0;
			delay_q0 <= 16'd0;
			delay_q1 <= 16'd0;
		end else begin
			delay_i0 <= tap_i_w;
			delay_i1 <= delay_i0;
			
			delay_q0 <= tap_q_w;
			delay_q1 <= -delay_q0;
		end
	end
	
	reg signed		[16 : 0]	s1;
	reg signed		[16 : 0]	s2;
	reg signed		[16 : 0]	s3;
	
	reg signed		[15 : 0]	d1;
	reg signed		[15 : 0]	d2;
	reg signed		[15 : 0]	d3;
	
	reg signed		[32 : 0]	m1;
	reg signed		[32 : 0]	m2;
	reg signed		[32 : 0]	m3;
	
	reg signed		[33 : 0]	s4;
	reg signed		[33 : 0]	s5;
	
	always@(posedge aclk or negedge aresetn)begin
		if(!aresetn)begin
			s1 <= 17'd0;
			s2 <= 17'd0;
			s3 <= 17'd0;
			d1 <= 16'd0;
			d2 <= 16'd0;
			d3 <= 16'd0;
		end else begin
			s1 <= $signed(delay_q0) + $signed(delay_i0);
			s2 <= $signed(delay_i1) - $signed(delay_q1);
			s3 <= $signed(delay_i1) + $signed(delay_q1);
			d1 <= delay_q0;
			d2 <= delay_i0;
			d3 <= delay_q1;
			
			m1 <= $signed(d3) * $signed(s1);
			m2 <= $signed(d1) * $signed(s2);
			m3 <= $signed(d2) * $signed(s3);
			
			s4 <= $signed(m1) - $signed(m3);
			s5 <= $signed(m1) + $signed(m2);
		end
	end
	
	assign out_i = s4[33:18];
	assign out_q = s5[33:18];
	
endmodule
