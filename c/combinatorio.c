#include <stdio.h>

unsigned int fcombin(unsigned int n, unsigned int k) 
{
    return k == 0 || k == n ? 1 : fcombin(n - 1, k - 1) + fcombin(n - 1, k);
}

int main() {
    unsigned int n,k;
    unsigned int i = 0;
    unsigned int DEPTH = 6;

    for (n = 0; n <= DEPTH; ++n) 
    {
        for (i = 0; i <= (DEPTH - n); ++i) 
        {
          printf(" ");
        }
        for (k = 0; k <= n; ++k) 
        {
          printf("%d ", fcombin(n, k));
        }
        printf("\n");
    }
  return 0;
}
