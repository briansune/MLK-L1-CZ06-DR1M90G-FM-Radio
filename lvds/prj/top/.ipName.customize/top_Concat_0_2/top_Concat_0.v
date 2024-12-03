/************************************************************\
**	Copyright (c) 2012-2024 Anlogic Inc.
**	All Right Reserved.
\************************************************************/
/************************************************************\
**	Build time: Dec 03 2024 17:56:58
**	TD version	:	5.9.122301
************************************************************/
module top_Concat_0
(
  input   [0:0]                 In0,
  input   [5:0]                 In1,
  output  [6:0]                 Dout
);

  concat_34bc40459dfa
  #(
      .PORT_NUM(2),
      .IN_WIDTH_0(1),
      .IN_WIDTH_1(6),
      .OUT_WIDTH(7)
  )concat_34bc40459dfa_Inst
  (
      .In0(In0),
      .In1(In1),
      .Dout(Dout)
  );
endmodule
