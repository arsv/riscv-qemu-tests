.include "test.s"

START

  # Arithmetic tests

  TEST_FP_OP2_S  2,  fadd.s, 0,                3.5,        2.5,        1.0
  TEST_FP_OP2_S  3,  fadd.s, 1,              -1234,    -1235.1,        1.1
  TEST_FP_OP2_S  4,  fadd.s, 1,         3.14159265, 3.14159265, 0.00000001

  TEST_FP_OP2_S  5,  fsub.s, 0,                1.5,        2.5,        1.0
  TEST_FP_OP2_S  6,  fsub.s, 1,              -1234,    -1235.1,       -1.1
  TEST_FP_OP2_S  7,  fsub.s, 1,         3.14159265, 3.14159265, 0.00000001

  TEST_FP_OP2_S  8,  fmul.s, 0,                2.5,        2.5,        1.0
  TEST_FP_OP2_S  9,  fmul.s, 1,            1358.61,    -1235.1,       -1.1
  TEST_FP_OP2_S 10,  fmul.s, 1,      3.14159265e-8, 3.14159265, 0.00000001

  # Is the canonical NaN generated for Inf - Inf?
  TEST_FP_OP2_S 11,  fsub.s, 0x10,         0f:7fc00000, Inf, Inf

EXIT
