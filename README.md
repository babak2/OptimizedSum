# OptimizedSum

OptimizedSum is a C++ program developed on Visual Studio that provides an optimized parallel method for calculating the sum of numbers.

It demonstrates the performance (execution speed) difference between CPU and CUDA implementations.


## Installation

You can install OptimizedSum by following these steps:

1. Clone the GitHub repository to your local machine:

   ```
   git clone https://github.com/babak2/OptimizedSum.git
   ```

   Navigate to the project directory:

   ```
   cd OptimizedSum
   ```

3. Build the program using Visual Studio or your preferred C++ compiler.

4. Run the compiled program to perform optimized summation calculations.

## Program Requirement

To use OptimizedSum, you need the following software and hardware requirements:

- C++ compiler (e.g., Visual Studio, g++, clang++)
- CMake (optional, for building with CMake)
- CUDA (Compute Unified Device Architecture) from NVIDIA installed, along with an NVIDIA GPU, if you plan to utilize GPU acceleration for certain calculations.

Make sure you have CUDA from NVIDIA installed and properly configured with a compatible NVIDIA GPU if you intend to take advantage of GPU acceleration. 

Users without an NVIDIA GPU may still use the CPU-based functionality of the program.

## Usage

To use OptimizedSum, follow these steps:

1. Compile the program as mentioned in the Installation section.

2. Run the compiled executable from the command line.
   ```./OptimizedSum   ```

3. Follow the on-screen instructions to input numbers for summation.

4. The program will calculate the sum of the entered numbers using an optimized algorithm.


## Output Example

Here's an example of the OptimizedSum output:


CPU Sum: 494483662 - Time: 0.035 seconds
CUDA Sum: 494483662 - Time: 0.021 seconds
CPU Time: 0.035 seconds
CUDA Time: 0.021 seconds
Speedup: 1.66667x 



## License

This project is licensed under the MIT License. See the LICENSE file for details.

## Author

Babak Mahdavi Aresetani

babak.m.ardestani@gmail.com
