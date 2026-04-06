/**
 * @file dot_product.cpp
 * @author Ryan Smith (smithrm23@juniata.edu)
 * @brief Calculate the dot product of two arrays.
 * @date 2026-04-06
 * @copyright Copyright (c) 2026
 * 
 * Question 3: Comparison of iterative and functional approaches to this problem
 * 
 * In an imperative language, this algorithm is typically implemented using a simple
 * iterative approach. By contrast, LISP espresses the same algorithm using recursion
 * and high-level function calls. In C++, conditions are checked with a if statement
 * and the calculation is done with iteration. LISP supports checking all conditions
 * concisely and the calculation is with recursion.
 * 
 * LISP code is expressive and concise, as it removes the need to store intermediate
 * states or create local variables. Imperative languages like C++ require explicit
 * flow and state control, which leads to larger files but code that is often clearler
 * and easier to follow for developers familair with the syntax.
 * 
 * C++ compiles to run directly on hardware, offering low-level control over memory,
 * program execution, and high performance. LISP's abstraction of program state and
 * complex structures into simple function calls allows developers to write cleaner,
 * more expressive code than they might be able to do in an imperative language
 * like C++ or Java. This is especially true for algorithms or methods that have
 * idiomatic, recursive solutions.
 */

#include <exception>
#include <iostream>
#include <vector> 

/**
 * @brief Take the dot product of two vectors
 * 
 * @param vec1 	The first vector
 * @param vec2 	The second vector
 * @return int 	The dot product of the two vectors
 */
int dotProduct(const std::vector<int>& vec1, const std::vector<int>& vec2) {
	if (vec1.size() != vec2.size()) {
		throw std::invalid_argument("Invalid length");
	}

	int result = 0;
	for (int i = 0; i < vec1.size(); i++) {
		result += vec1[i] * vec2[i];
	}

	return result;
}

/**
 * @brief Test driver
 * 
 * @return int `0` on success, non-zero otherwise.
 */
int main() {
	std::cout << dotProduct({1, 2, 3}, {4, 5, 6}) 			  << "\n"; 	// 32
	std::cout << dotProduct({10, 5, 34, 32}, {78, 32, 1, 56}) << "\n"; 	// 2766
	std::cout << dotProduct({}, {}) 			  	  		  << "\n"; 	// 0

	try {
		std::cout << dotProduct({1, 2}, {3, 4, 5}) << "\n"; 			// "Invalid length"
	} catch (const std::invalid_argument& e) {
		std::cout << e.what() << "\n";
	}


	return 0;
}