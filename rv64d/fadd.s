.include "test.s"

START

  TEST_FP_OP2_D  2,  fadd.d, 0,                3.5,        2.5,        1.0
  TEST_FP_OP2_D  3,  fadd.d, 1,              -1234,    -1235.1,        1.1
  TEST_FP_OP2_D  4,  fadd.d, 1,         3.14159266, 3.14159265, 0.00000001

  TEST_FP_OP2_D  5,  fsub.d, 0,                1.5,        2.5,        1.0
  TEST_FP_OP2_D  6,  fsub.d, 1,              -1234,    -1235.1,       -1.1
  TEST_FP_OP2_D  7,  fsub.d, 1, 3.1415926400000001, 3.14159265, 0.00000001

  TEST_FP_OP2_D  8,  fmul.d, 0,                2.5,        2.5,        1.0
  TEST_FP_OP2_D  9,  fmul.d, 1,            1358.61,    -1235.1,       -1.1
  TEST_FP_OP2_D 10,  fmul.d, 1,      3.14159265e-8, 3.14159265, 0.00000001

  # Is the canonical NaN generated for Inf - Inf?
  TEST_FP_OP2_D 11,  fsub.d, 0x10, 0d:7ff8000000000000, Inf, Inf

EXIT
