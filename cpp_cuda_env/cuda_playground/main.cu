// This program computes the sum of two vectors of length N
// By: Nick from CoffeeBeforeArch

#include <algorithm>
#include <cassert>
#include <iostream>
#include <vector>

static void HandleError(cudaError_t err, const char *file, int line) {
  if (err != cudaSuccess) {
    printf("%s in %s at line %d\n", cudaGetErrorString(err), file, line);
    exit(EXIT_FAILURE);
  }
}
#define HANDLE_ERROR(err) (HandleError(err, __FILE__, __LINE__))

// CUDA kernel for vector addition
// __global__ means this is called from the CPU, and runs on the GPU
__global__ void vectorAdd(const int *__restrict a, const int *__restrict b,
                          int *__restrict c, int N) {
  // Calculate global thread ID
  int tid = (blockIdx.x * blockDim.x) + threadIdx.x;

  // Boundary check
  if (tid < N) c[tid] = a[tid] + b[tid];
}

// Check vector add result
void verify_result(std::vector<int> &a, std::vector<int> &b,
                   std::vector<int> &c) {
  for (size_t i = 0U; i < a.size(); i++) {
    assert(c[i] == a[i] + b[i]);
  }
}

int main() {
  // Array size of 2^16 (65536 elements)
  constexpr int N = 1 << 16;
  constexpr size_t bytes = sizeof(int) * N;

  // Vectors for holding the host-side (CPU-side) data
  std::vector<int> a;
  a.reserve(N);
  std::vector<int> b;
  b.reserve(N);
  std::vector<int> c;
  c.reserve(N);

  // Initialize random numbers in each array
  for (size_t i = 0U; i < N; i++) {
    a.push_back(rand() % 100);
    b.push_back(rand() % 100);
  }

  // Allocate memory on the device
  int *d_a, *d_b, *d_c;
  HANDLE_ERROR(cudaMalloc(&d_a, bytes));
  HANDLE_ERROR(cudaMalloc(&d_b, bytes));
  HANDLE_ERROR(cudaMalloc(&d_c, bytes));

  // Copy data from the host to the device (CPU -> GPU)
  HANDLE_ERROR(cudaMemcpy(d_a, a.data(), bytes, cudaMemcpyHostToDevice));
  HANDLE_ERROR(cudaMemcpy(d_b, b.data(), bytes, cudaMemcpyHostToDevice));

  // Threads per CTA (1024)
  int NUM_THREADS = 1 << 10;

  // CTAs per Grid
  // We need to launch at LEAST as many threads as we have elements
  // This equation pads an extra CTA to the grid if N cannot evenly be divided
  // by NUM_THREADS (e.g. N = 1025, NUM_THREADS = 1024)
  int NUM_BLOCKS = (N + NUM_THREADS - 1) / NUM_THREADS;

  // Launch the kernel on the GPU
  // Kernel calls are asynchronous (the CPU program continues execution after
  // call, but no necessarily before the kernel finishes)
  vectorAdd<<<NUM_BLOCKS, NUM_THREADS>>>(d_a, d_b, d_c, N);

  // Copy sum vector from device to host
  // cudaMemcpy is a synchronous operation, and waits for the prior kernel
  // launch to complete (both go to the default stream in this case).
  // Therefore, this cudaMemcpy acts as both a memcpy and synchronization
  // barrier.
  HANDLE_ERROR(cudaMemcpy(c.data(), d_c, bytes, cudaMemcpyDeviceToHost));

  // Check result for errors
  verify_result(a, b, c);

  // Free memory on device
  HANDLE_ERROR(cudaFree(d_a));
  HANDLE_ERROR(cudaFree(d_b));
  HANDLE_ERROR(cudaFree(d_c));

  std::cout << "COMPLETED SUCCESSFULLY\n";

  return 0;
}