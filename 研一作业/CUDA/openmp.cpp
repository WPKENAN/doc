#include <bits/stdc++.h>
#include "omp.h"
#include<Windows.h>
using namespace std;
#define N 10000
#define THREADS_NUM 10
int main(int argc, char **argv) {
	int *a,*b;
	a=(int*)malloc(sizeof(int)*N*N);
	b=(int*)malloc(sizeof(int)*N*N);

	for(int i=0;i<N*N;i++){
		a[i]=i;
	}

	// for(int i=0;i<N;i++){
	// 	for(int j=0;j<N;j++){/
	
	// 		cout << a[i*N+j] << ' ';
	// 	}
	// 	cout << endl;
	// }

	//设置线程数，一般设置的线程数不超过CPU核心数，这里开4个线程执行并行代码段
	clock_t start;
	cout << "Matrix scale is: " << N << "^2" << endl;
	for(int k=1;k<=THREADS_NUM;k++){
		start=clock();
		omp_set_num_threads(k);
		#pragma omp parallel for
		for (int i = 0; i < N*N; i++){
			if(i/N==0||i/N==N-1||i%N==0||i%N==N-1){
				b[i]=0;
			}else{
				b[i]=a[i-N]+a[i+N]+a[i-1]+a[i+1];
			}
		}
		// Sleep(100);
		cout << k <<" threads spend: " << clock()-start << "ms" << endl;
	}
	

	// for(int i=0;i<N;i++){
	// 	for(int j=0;j<N;j++){
	// 		cout << b[i*N+j] << ' ';
	// 	}
	// 	cout << endl;
	// }
	return 0;
}
