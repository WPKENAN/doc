#include "iostream"
#include "stdio.h"
#include "time.h"
#include<Windows.h>
// #include "o"
using namespace std;
int N=10;
#define THREDS_NUMBER 1

__global__ void add(int *a, int *b,int N){
  int tid = threadIdx.x;  //计算机该索引处的数据
  // printf("**************tid: %d\n",tid);
  int cnt=0;
  // printf("N: %d",N*N);
  while(tid<N*N){
  	cnt++;

  	if(tid/N==0||tid/N==N-1||tid%N==0||tid%N==N-1){
  		b[tid]=0;
  	}else{
  		b[tid]=a[tid-N]+a[tid+N]+a[tid-1]+a[tid+1];
  	}
  	tid=tid+THREDS_NUMBER;
  }

}

__global__ void kernal(void){
	// cout << blockIdx.x << endl;
	printf("blockIdx.x: %d Hello cudaKernal!\n",blockIdx.x);
	// printf("");

}


int main(){


	LARGE_INTEGER timeStart;	//开始时间
	LARGE_INTEGER timeEnd;		//结束时间
	LARGE_INTEGER frequency;	//计时器频率

	QueryPerformanceFrequency(&frequency);
	double quadpart = (double)frequency.QuadPart;//计时器频率	

	while(N<=1e7){
		// cout << "Please input the scale of matrix: " ;
		// cin >> N;
		cout << "The scale of matrix: " << N << "^2" << endl;
		// cin >> N;
		clock_t startTime,endTime;

		int *a,*b;
		a=(int*)malloc(N*N*sizeof(int));
		b=(int*)malloc(N*N*sizeof(int));
		// cout << "The run time is:" << ((DWORD)GetTickCount() - start_time) << "ms!" << endl;

		int *dev_a, *dev_b;
		// freopen("out.txt","w",stdout);
		//在GPU上分配内存，注意这里要知道为什么使用void**
		cudaMalloc( (void**)&dev_a, N*N*sizeof(int));
		cudaMalloc( (void**)&dev_b, N*N*sizeof(int));

		// cout << "The run time is:" << ((DWORD)GetTickCount() - start_time) << "ms!" << endl;
		
		// printf("start\n");
		//创建a值
		for(int i=0;i<N*N;i++){
			a[i]=i;
		}
		// cout << "The run time is:" << ((DWORD)GetTickCount() - start_time) << "ms!" << endl;
		// for(int i=0;i<N;i++){
		// 	for(int j=0;j<N;j++){/
		
		// 		cout << a[i*N+j] << ' ';
		// 	}
		// 	cout << endl;
		// }

		// Sleep(100);
		// //将数组a，b复制到GPU
		cudaMemcpy(dev_a, a, N*N*sizeof(int),cudaMemcpyHostToDevice);
		cudaMemcpy(dev_b, b, N*N*sizeof(int), cudaMemcpyHostToDevice);
		// cout << "start" << endl;
		// clock_t start_time = clock();

		QueryPerformanceCounter(&timeStart);
		add<<<1,THREDS_NUMBER>>>(dev_a, dev_b,N);
		QueryPerformanceCounter(&timeEnd);
		// cout << quadpart << endl;
		double elapsed = (timeEnd.QuadPart - timeStart.QuadPart) / quadpart*1000;
		cout << elapsed << "ms" << endl;//单位为秒，精度为微秒(1000000/cpu主频)

		// cout << CLOCKS_PER_SEC << endl;
		// cout << "The run time is:" << (clock() - start_time) << "ms!" << endl;
		// cout << "TimeSpend: " << endTime-startTime << "ms" << endl;
		cudaMemcpy(b, dev_b, N*N*sizeof(int), cudaMemcpyDeviceToHost);

		// cout << "****************************************" << endl;
		// cout << "The run time is:" << ((DWORD)GetTickCount() - start_time) << "ms!" << endl;
		//显式结果
		// for(int i=0;i<N;i++){
		// 	for(int j=0;j<N;j++){
		// 		cout << b[i*N+j] << ' ';
		// 	}
		// 	cout << endl;
		// }
		//释放GPU上分配的内存
		cudaFree(dev_a);
		cudaFree(dev_b);

		
		// cout << "The run time is:" << ((DWORD)GetTickCount() - start_time) << "ms!" << endl;
		// cout << endTime << endl;
		// endTime=clock();
		N=N*10;
  	
	}
	// system("pause");
	return 0;
}