#!/bin/bash

# Set matrix size and iterations
MATRIX_SIZE=128
NUM_ITERATIONS=10

# Run benchmark for Von Neumann architecture (GCC compiler)
echo "Compiling for Von Neumann architecture (traditional CPU)..."
gcc -o matrix_multiply_von_neumann matrix_multiply.c -O2

echo "Running benchmark for Von Neumann architecture..."
total_time_vn=0
for ((i=1; i<=NUM_ITERATIONS; i++)); do
    echo "Iteration $i..."
    time_output=$(./matrix_multiply_von_neumann | grep "Time taken" | awk '{print $3}')
    total_time_vn=$(echo "$total_time_vn + $time_output" | bc)
done

average_time_vn=$(echo "scale=6; $total_time_vn / $NUM_ITERATIONS" | bc)
echo "Average time on Von Neumann architecture: $average_time_vn seconds"

# Run benchmark for VLIW architecture (with aggressive optimization)
echo "Compiling for VLIW architecture (using aggressive optimizations)..."
gcc -o matrix_multiply_vliw matrix_multiply.c -O3 -ftree-vectorize -funroll-loops

echo "Running benchmark for VLIW architecture..."
total_time_vliw=0
for ((i=1; i<=NUM_ITERATIONS; i++)); do
    echo "Iteration $i..."
    time_output=$(./matrix_multiply_vliw | grep "Time taken" | awk '{print $3}')
    total_time_vliw=$(echo "$total_time_vliw + $time_output" | bc)
done

average_time_vliw=$(echo "scale=6; $total_time_vliw / $NUM_ITERATIONS" | bc)
echo "Average time on VLIW architecture: $average_time_vliw seconds"

# Print performance difference
performance_diff=$(echo "scale=2; $average_time_vn / $average_time_vliw" | bc)
echo "Performance speedup of VLIW over Von Neumann: $performance_diff times faster"

