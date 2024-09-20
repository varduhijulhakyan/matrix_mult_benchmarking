Matrix Multiplication Benchmarking
This project contains benchmarking scripts and source code to demonstrate the performance differences between two types of CPU architectures: VLIW (Very Long Instruction Word) and Von Neumann.

Matrix multiplication is chosen as the test case due to its high potential for parallelism, which can showcase the performance benefits of VLIW architectures. The code is written in C, and the provided scripts will help you compile and run the benchmark on both architectures.

Benchmark Overview
The benchmark focuses on matrix multiplication, an operation with a time complexity of O(n^3), where n is the matrix dimension. The performance of the multiplication is evaluated in two key areas:
  Throughput: Measures how many operations are completed per second.
  Latency: Measures the time taken to complete one matrix multiplication operation.

Key Elements of the Benchmark
Matrix Multiplication: The benchmark tests the performance of matrix multiplication for various matrix sizes, making it an ideal case to exploit instruction-level parallelism.

Performance Metrics:
  Throughput: Calculated by measuring the total number of matrix operations per second.
  Latency: Measured as the time taken to complete a single matrix multiplication.

Architectural Variants:
Von Neumann Version: A standard C implementation with basic compiler optimizations (e.g., -O2).
VLIW Version: Optimized using aggressive compiler flags (e.g., -O3, -ftree-vectorize, and -funroll-loops) to expose parallelism and maximize instruction throughput.

Timing: The benchmark uses high-resolution timers to accurately measure execution time and performance differences between the two architectures.

How to Run the Benchmark
Requirements
  A C compiler (e.g., GCC or Clang).
  A Unix-like environment (Linux, macOS) or a similar setup that supports Bash scripts.

Running the Benchmark
Clone the repository:
  bash
  Copy code
  git clone <repository-url>
  cd matrix_mult_benchmarking
  Compile and Run the Benchmark:

A Bash script is provided to automate the benchmarking process.

To run the benchmark:
  bash
  Copy code
  chmod +x benchmark.sh
  ./benchmark.sh

The script will:

Compile the matrix multiplication program twice: once optimized for a Von Neumann architecture and once for a VLIW architecture.
Run the matrix multiplication for both versions and repeat the test multiple times.
Report the average execution time and calculate the speedup of VLIW over Von Neumann.

Customizing Matrix Size: By default, the benchmark runs matrix multiplication with a 128x128 matrix. To change the matrix size, modify the #define SIZE line in matrix_multiply.c.

Output: The benchmark will output the average execution time for each architecture and the performance speedup of VLIW over Von Neumann. 
Example output:
  Average time on Von Neumann architecture: 0.245632 seconds
  Average time on VLIW architecture: 0.121543 seconds
Performance speedup of VLIW over Von Neumann: 2.02x faster

Optimization Details
Von Neumann Version:
Compiled with moderate optimizations using the -O2 flag to balance execution speed and code size.
VLIW Version:
Compiled with aggressive optimizations (-O3, -ftree-vectorize, -funroll-loops) to maximize parallel execution of instructions.
These flags are designed to take advantage of instruction-level parallelism (ILP) in VLIW architectures, reducing latency and improving throughput.

Customization and Testing
Matrix Size: Modify the matrix size by changing the SIZE constant in the matrix_multiply.c file to test performance with larger or smaller matrices.

Iterations: You can adjust the number of iterations in the benchmark.sh script to get more precise averages.

Conclusion
This project provides a clear demonstration of the performance differences between traditional Von Neumann and VLIW architectures, highlighting the advantages of parallelism in compute-intensive tasks like matrix multiplication.

Future Improvements
Add support for other algorithms (e.g., sorting, FFT) to further explore architectural differences.
Explore vectorization through SIMD instructions and test on modern multi-core CPUs to see how they compare with VLIW performance.
License
This project is open-source and available under the MIT License. Feel free to contribute!

Contact
For any questions or issues, please reach out via GitHub Issues.

