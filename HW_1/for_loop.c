#include <stdio.h>

unsigned long long factorialForLoop(int n) {
    unsigned long long result = 1;
    for (int i = 1; i <= n; ++i) {
        result *= i;
    }
    return result;
}

int main() {
    int n;
    printf("Enter an integer: ");
    scanf("%d", &n);

    if (n < 0) {
        printf("You fr gotta enter a positive number cuh, ik math ain't your strong suit \n");
    } else {
        printf("Factorial using for loop: %llu\n", factorialForLoop(n));
    }

    return 0;
}