#include "bm_oopsla.h"

int main(int argc, char * argv[]) {
  RECORD(6, a, b, i, j, k, flag);

  INIT_a(unknown);
  INIT_b(unknown);
  INIT_k(unknown);
  INIT_flag(unknown);

  j = 1;
  if (flag != 0) {
    i = 0;
  } else {
    i = 1;
  }

  while (unknown1()) {
    PRINT_VARS();
    i += 2;
    if (i % 2 == 0) {
      j += 2;
    } else
      j++;
  }
  PRINT_VARS();
  PRINT_BAR(1);

  a = 0;
  b = 0;

  while (unknown2()) {
    PRINT_VARS();
    a++;
    b += (j - i);
  }
  PRINT_VARS();
  PRINT_BAR(2);

  if (flag != 0) assert(a == b);
}
