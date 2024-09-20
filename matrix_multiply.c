#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Define the size of the matrices
#define SIZE 128

// Function to multiply matrices A and B, storing the result in C
void matrix_multiply(float A[SIZE][SIZE], float B[SIZE][SIZE], float C[SIZE][SIZE]) {
    int i, j, k;
    for (i = 0; i < SIZE; i++) {
        for (j = 0; j < SIZE; j++) {
            C[i][j] = 0.0;
            for (k = 0; k < SIZE; k++) {
                C[i][j] += A[i][k] * B[k][j];
            }
        }
    }
}

// Function to initialize matrices with random values
void initialize_matrix(float matrix[SIZE][SIZE]) {
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            matrix[i][j] = (float)(rand() % 10);
        }
    }
}

// Timer helper function
double get_time_diff(clock_t start, clock_t end) {
    return (double)(end - start) / CLOCKS_PER_SEC;
}

int main() {
    // Declare matrices
    float A[SIZE][SIZE], B[SIZE][SIZE], C[SIZE][SIZE];

    // Initialize matrices A and B
    initialize_matrix(A);
    initialize_matrix(B);

    // Time the matrix multiplication
    clock_t start_time = clock();
    matrix_multiply(A, B, C);
    clock_t end_time = clock();

    // Display results
    printf("Matrix multiplication completed.\n");
    printf("Time taken: %f seconds\n", get_time_diff(start_time, end_time));

    return 0;
}

