#include <cuda_runtime.h>
#include <iostream>
#include <stdlib.h>
#include <time.h>
#include <thread>

__global__ void add(float* x, float* y, float* z, int n)
{
    // ��ȡȫ������
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    // ����
    int stride = blockDim.x * gridDim.x;
    for (int i = index; i < n; i += stride)
    {
        z[i] = x[i] * y[i];
    }
}

/*
int main(void)
{
    int N = 1e8;
    int nBytes = N * sizeof(float);

    // �����й��ڴ�
    float* x, * y, * z1, *z2;
    cudaMallocManaged((void**)&x, nBytes);
    cudaMallocManaged((void**)&y, nBytes);
    cudaMallocManaged((void**)&z1, nBytes);

    // ��ʼ������
    for (int i = 0; i < N; ++i)
    {
        x[i] = 11110.0;
        y[i] = 22220.0;
    }

    clock_t start1 = clock();
    for (int i = 0; i < N; i++) {
        z2[i] = x[i] * y[i];
    }
    clock_t end1 = clock();
    clock_t start2 = clock();
    // ����kernel��ִ������
    dim3 blockSize(256);
    dim3 gridSize((N + blockSize.x - 1) / blockSize.x);
    // ִ��kernel
    add << < gridSize, blockSize >> > (x, y, z1, N);
    // ͬ��device ��֤�������ȷ����
    cudaDeviceSynchronize();
    // ���ִ�н��
    clock_t end2 = clock();
    
    // output
    double t1 = ((double)(end1 - start1)) / CLOCKS_PER_SEC;
    double t2 = ((double)(end2 - start2)) / CLOCKS_PER_SEC;
    std::cout << "time (CPU): " << t1 * 1000 << " ms" << std::endl;
    std::cout << "time (GPU): " << t2 * 1000 << " ms" << std::endl;

    // �ͷ��ڴ�
    cudaFree(x);
    cudaFree(y);
    cudaFree(z1);
    cudaFree(z2);

    return 0;
}
*/