/************************************************************\
**	Copyright (c) 2012-2024 Anlogic Inc.
**	All Right Reserved.
\************************************************************/
/************************************************************\
**	Build time: Dec 03 2024 15:07:28
**	TD version	:	5.9.122301
************************************************************/
module top_reset2resetn_0
(
  input   [0:0]                 vector_a,
  output  [0:0]                 result_vector
);

  Utility_Vector_Logic_4fdfa6bb2a72
  #(
      .OPERATION(3),
      .SIZE(1)
  )Utility_Vector_Logic_4fdfa6bb2a72_Inst
  (
      .vector_a(vector_a),
      .result_vector(result_vector)
  );
endmodule
