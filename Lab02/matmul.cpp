/**
 * --------------------------------- Results --------------------------------
 * 
 * --------------------------- Original Ordering ----------------------------
 * SIZE = 100:  0.008934s
 * SIZE = 250:  0.082336s
 * SIZE = 500:  0.464688s
 * SIZE = 750:  1.51091s
 * SIZE = 1000: 3.57254s
 * 
 * ----------------------------- k-j-i Ordering -----------------------------
 * SIZE = 100:  0.004504s
 * SIZE = 250:  0.045725s
 * SIZE = 500:  0.230557s
 * SIZE = 750:  0.735713s
 * SIZE = 1000: 1.64332s
 * 
 * ----------------------------- j-i-k Ordering -----------------------------
 * SIZE = 100:  0.009065s
 * SIZE = 250:  0.074866s
 * SIZE = 500:  0.468706s
 * SIZE = 750:  1.50732s
 * SIZE = 1000: 1.51555s
 * 
 * ----------------------- With Optimization Level O3 ------------------------
 * SIZE = 100:  0.002067s
 * SIZE = 250:  0.031677s
 * SIZE = 500:  0.169911s
 * SIZE = 750:  0.505719s
 * SIZE = 1000: 1.16932s
 *
 * --------- Jupyter Notebook Timings (rounded to 6 decimal places) ----------
 * Naive Method:
 * SIZE = 100:  1.425035s
 * SIZE = 250:  21.118465s
 * SIZE = 500:  165.288769s
 * SIZE = 750:  570.289239s
 * SIZE = 1000: 1356.586899s
 * 
 * JIT Method:
 * SIZE = 100:  0.969020s
 * SIZE = 250:  1.158417s
 * SIZE = 500:  1.009562s
 * SIZE = 750:  1.262489s
 * SIZE = 1000: 2.395387s
 * 
 * TensorFlow Method:
 * SIZE = 100:  0.102480s
 * SIZE = 250:  0.001927s
 * SIZE = 500:  0.007290s
 * SIZE = 750:  0.012207s
 * SIZE = 1000: 0.042451
 * 
 * ------------------------------- Conclusion ---------------------------------
 * By changing the loop order (which index variable is in which loop),
 * we can significantly affect the performance of the matrix multiplication
 * without changing the algorithm. By adding -O3, we can tell the compiler to
 * make optimizations like inlining functions and modifying the way loops are
 * executed to improve performance.
 */

#include <iostream>
#include <cmath>
#include <ctime>

using namespace std;

#define SIZE 1000

const int N = SIZE;

double A[N][N];
double B[N][N];
double C[N][N];

int main() {
	int i, j, k;

	clock_t start = clock();

	//fill matrices
	for (i=0; i<N; i++) {
		for (j=0; j<N; j++) {
			A[i][j] = 10*rand() +  2*double(i)*double(j);
			B[i][j] = 10*rand() + -2*double(i)*double(j);
			C[i][j] = 0.0;
		}
	}

	//print matrices
	// for (i=0; i<N; i++) {
	// 	cout << "A:row " << i << " ";
	// 	for (j=0; j<N; j++) cout << A[i][j] << " ";
	// 	cout << endl;
	// }
	// cout << endl;
	// for (i=0; i<N; i++) {
	// 	cout << "B:row " << i << " ";
	// 	for (j=0; j<N; j++) cout << B[i][j] << " ";
	// 	cout << endl;
	// }
	// cout << endl;
	// for (i=0; i<N; i++) {
	// 	cout << "C:row " << i << " ";
	// 	for (j=0; j<N; j++) cout << C[i][j] << " ";
	// 	cout << endl;
	// }
	// cout << endl;
	
	// multiply
	for (i=0; i<N; i++) 
		for (j=0; j<N; j++)
			for (k=0; k<N; k++) C[i][j] = C[i][j]+A[i][k]*B[k][j];

	clock_t end = clock();
	double time = static_cast<double>(end - start) / CLOCKS_PER_SEC;

	cout << "Size = " << SIZE << "\nTime taken: " << time << "s" << endl;

	// cout << endl;
	// for (i=0; i<N; i++) {
	// 	cout << "C:row " << i << " ";
	// 	for (j=0; j<N; j++) cout << C[i][j] << " ";
	// 	cout << endl;
	// }
	// cout << endl;
}