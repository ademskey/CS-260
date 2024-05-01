#include <stdio.h>

double factorialForLoop(int n) {
    double result = 1;
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
        printf("Factorial using for loop (double): %f\n", factorialForLoop(n));
    }

    return 0;
}