.include "test.s"

START

  # Basic tests

  TEST_LD_OP 2, ld, 0x00ff00ff00ff00ff, 0,  tdat
  TEST_LD_OP 3, ld, 0xff00ff00ff00ff00, 8,  tdat
  TEST_LD_OP 4, ld, 0x0ff00ff00ff00ff0, 16, tdat
  TEST_LD_OP 5, ld, 0xf00ff00ff00ff00f, 24, tdat

  # Test with negative offset

  TEST_LD_OP 6, ld, 0x00ff00ff00ff00ff, -24, tdat4
  TEST_LD_OP 7, ld, 0xff00ff00ff00ff00, -16, tdat4
  TEST_LD_OP 8, ld, 0x0ff00ff00ff00ff0, -8,  tdat4
  TEST_LD_OP 9, ld, 0xf00ff00ff00ff00f, 0,   tdat4

  # Test with a negative base

    la  x1, tdat
    addi x1, x1, -32
    ld x3, 32(x1)
  TEST_CASE 10, x3, 0x00ff00ff00ff00ff

  # Test with unaligned base

    la  x1, tdat
    addi x1, x1, -3
    ld x3, 11(x1)
  TEST_CASE 11, x3, 0xff00ff00ff00ff00

  # Bypassing tests

  TEST_LD_DEST_BYPASS 12, 0, ld, 0x0ff00ff00ff00ff0, 8, tdat2
  TEST_LD_DEST_BYPASS 13, 1, ld, 0xf00ff00ff00ff00f, 8, tdat3
  TEST_LD_DEST_BYPASS 14, 2, ld, 0xff00ff00ff00ff00, 8, tdat1

  TEST_LD_SRC1_BYPASS 15, 0, ld, 0x0ff00ff00ff00ff0, 8, tdat2
  TEST_LD_SRC1_BYPASS 16, 1, ld, 0xf00ff00ff00ff00f, 8, tdat3
  TEST_LD_SRC1_BYPASS 17, 2, ld, 0xff00ff00ff00ff00, 8, tdat1

  # Test write-after-write hazard

    la  x3, tdat
    ld  x2, 0(x3)
    li  x2, 2
  TEST_CASE 18, x2, 2

    la  x3, tdat
    ld  x2, 0(x3)
    nop
    li  x2, 2
  TEST_CASE 19, x2, 2

EXIT

.data

tdat:
tdat1:  .dword 0x00ff00ff00ff00ff
tdat2:  .dword 0xff00ff00ff00ff00
tdat3:  .dword 0x0ff00ff00ff00ff0
tdat4:  .dword 0xf00ff00ff00ff00f
