.include "test.s"

START

  # Arithmetic tests

  TEST_RR_OP 2, remu,   2,  20,   6
  TEST_RR_OP 3, remu,   2, -20,   6
  TEST_RR_OP 4, remu,  20,  20,  -6
  TEST_RR_OP 5, remu, -20, -20,  -6

  TEST_RR_OP 6, remu,      0, -1<<63,  1
  TEST_RR_OP 7, remu, -1<<63, -1<<63, -1

  TEST_RR_OP 8, remu, -1<<63, -1<<63, 0
  TEST_RR_OP 9, remu,      1,      1, 0
  TEST_RR_OP 10, remu,      0,      0, 0

EXIT
