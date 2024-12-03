/************************************************************\
**	Copyright (c) 2012-2024 Anlogic Inc.
**	All Right Reserved.
\************************************************************/
/************************************************************\
**	Build time: Dec 01 2024 11:05:42
**	TD version	:	5.9.122301
************************************************************/
module top_Utility_Vector_Logic_0
(
  input   [0:0]                 vector_a,
  output  [0:0]                 result_vector
);

  Utility_Vector_Logic_1968c811592b
  #(
      .OPERATION(3),
      .SIZE(1)
  )Utility_Vector_Logic_1968c811592b_Inst
  (
      .vector_a(vector_a),
      .result_vector(result_vector)
  );
endmodule
