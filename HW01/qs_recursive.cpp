/**
 * @file 		qs_iterative.cpp
 * @author 		Ryan Smith (smithrm23@juniata)
 * @brief 		An iterative quicksort implementation in C++
 * @date 		2026-01-25
 * @copyright 	Copyright (c) 2026
 */

#include <algorithm>
#include <cstdlib>
#include <iostream>
#include <iterator>

/**
 * @brief 		Display an array as comma-separated values between square brackets
 * 
 * @param array The array to display
 */
void printArray(const int* array, std::size_t size) {
    std::cout << "[";
    if (size > 0) {
        std::copy(array, array + size - 1, std::ostream_iterator<int>(std::cout, ", "));
        std::cout << array[size - 1];
    }
    std::cout << "]\n";
}

/**
 * @brief 			Print the trace of a partition operation
 * 
 * @param left 		The left index
 * @param pivot 	The pivot index
 * @param right 	The right index
 * @param array 	The array being partitioned
 * @param size 		The size of the array
 */
void printTrace(int left, int pivot, int right, int array[5], std::size_t size) {
	std::cout << "\tAfter partition: "
			  << "p = " << left  << ", "
			  << "q = " << pivot << ", "
			  << "r = " << right << ", "
			  << "A = ";
	printArray(array, size);
}

/**
 * @brief 		Partition a given subset of elements in an array.
 * 				Utility function for Quicksort.
 * 
 * @param array The array to partition
 * @param left 	The start index of the range of elements to partition
 * @param right The end index of the range of elements to partition
 * 
 * @return 		The index of the element partitioned around
 * 
 * @note 		This function modifies `array`.
 */
int partition(int* array, int left, int right) {
	int pivot = array[right];
	int i = left - 1;

	for (int j = left; j < right - 1; j++) {
		if (array[j] < pivot) {
			i++;
			std::swap(array[i], array[j]);
		}
	}

	std::swap(array[i + 1], array[right]);
	return i + 1;
}

/**
 * @brief 		Perform a recursive quicksort on an array.
 * 
 * @param array The array to sort
 * @param size 	The size of the array
 * @param left 	The left index of the range to sort
 * @param right The right index of the range to sort
 */
void quicksort(int* array, std::size_t size, int left, int right) {
	if (left < right) {
		int pivot = partition(array, left, right);

		printTrace(left, pivot, right, array, size);

		quicksort(array, size, left, pivot - 1);
		quicksort(array, size, pivot + 1, right);
	}
}

/**
 * @brief 		The main function
 * 
 * @return 		int 
 */
int main() {
	int a[] = {3, 0, 8, 2, 5, 8, 8, 2};
	constexpr std::size_t size = sizeof(a) / sizeof(int);

	std::cout << "Initial array: ";
	printArray(a, size);

	quicksort(a, size, 0, size - 1);

	std::cout << "Sorted array: ";
	printArray(a, size);

	return 0;
}