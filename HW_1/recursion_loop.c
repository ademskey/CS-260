#include <stdio.h>

unsigned long long factorialRecursion(int n) {
    if (n == 0 || n == 1) {
        return 1;
    }
    return n * factorialRecursion(n - 1);
}

int main() {
    int n;
    printf("Enter an integer: ");
    scanf("%d", &n);

    if (n < 0) {
        printf("Enter a positive number boo it don't work like that.\n");
    } else {
        printf("Factorial using recursion: %llu\n", factorialRecursion(n)); //recursive statement
    }

    return 0;
}
