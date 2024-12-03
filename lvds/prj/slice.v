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

module slice(
	
	input wire		[6 : 0]		in0,
	output wire		[0 : 0]		out1,
	output wire		[5 : 0]		out0
);
	
	assign out1 = in0[6:6];
	assign out0 = in0[5:0];
	
endmodule
