
/*
Program: OptimizedSum - Demonstrating CPU vs. CUDA Summation
Author: Babak Mahdavi Ardestani
Date: October 26, 2022
*/


#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <iostream>
#include <cstdlib>
#include <ctime>

// CPU version to calculate the sum
int cpuSum(int* array, int size) {
    int sum = 0;
    for (int i = 0; i < size; i++) {
        sum += array[i];
    }
    return sum;
}

#ifdef __CUDACC__
// CUDA version to calculate the sum
__global__ void cudaSum(int* array, int* result, int size) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int localSum = 0;
    while (tid < size) {
        localSum += array[tid];
        tid += blockDim.x * gridDim.x;
    }
    atomicAdd(result, localSum);
}
#endif

int main() {
    const int size = 10000000;  // Size of the array
    int* h_array = new int[size];
    int* d_array, * d_result;

    // Initialize the array with random values
    srand(static_cast<unsigned>(time(0)));
    for (int i = 0; i < size; i++) {
        h_array[i] = rand() % 100;
    }

 

    // CPU version
    clock_t start_time_cpu = clock();
    int cpu_result = cpuSum(h_array, size);
    clock_t end_time_cpu = clock();
    double cpu_time = double(end_time_cpu - start_time_cpu) / CLOCKS_PER_SEC;
    std::cout << "CPU Sum: " << cpu_result << " - Time: " << cpu_time << " seconds\n";

    // CUDA version
    cudaMalloc((void**)&d_array, size * sizeof(int));
    cudaMalloc((void**)&d_result, sizeof(int));
    cudaMemcpy(d_array, h_array, size * sizeof(int), cudaMemcpyHostToDevice);
    cudaMemset(d_result, 0, sizeof(int));

    clock_t start_time = clock();
    int numThreads = 256;
    int numBlocks = (size + numThreads - 1) / numThreads;
    cudaSum << <numBlocks, numThreads >> > (d_array, d_result, size);

    cudaDeviceSynchronize();
    int cuda_result;
    cudaMemcpy(&cuda_result, d_result, sizeof(int), cudaMemcpyDeviceToHost);
    clock_t end_time = clock();
    double cuda_time = double(end_time - start_time) / CLOCKS_PER_SEC;
    std::cout << "CUDA Sum: " << cuda_result << " - Time: " << cuda_time << " seconds\n";

    cudaFree(d_array);
    cudaFree(d_result);
    delete[] h_array;

    std::cout << "CPU Time: " << cpu_time << " seconds\n";
    std::cout << "CUDA Time: " << cuda_time << " seconds\n";
    std::cout << "Speedup: " << cpu_time / cuda_time << "x\n";

    return 0;
}
