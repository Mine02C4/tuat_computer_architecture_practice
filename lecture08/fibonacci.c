#include <stdio.h>

int fibonacci(int n) {
  if (n == 0 || n == 1) {
    return n;
  } else {
    return fibonacci(n - 2) + fibonacci(n - 1);
  }
}

int main() {
  int input = 10;
  int fib = fibonacci(input);
  printf("fib = %d\n", fib);
  return 0;
}
