/**
 * euler_003.d
 * ````````````````````````````````````````````````````````````````````````````
 * The prime factors of 13195 are 5, 7, 13 and 29.
 * What is the largest prime factor of the number 600851475143 ?
 * ````````````````````````````````````````````````````````````````````````````
 */
module euler_003;

import std.math;
import std.array;
import std.stdio;
import std.algorithm;

int main(string[] argv)
{
	immutable long number = 600_851_475_143;

	auto largest = prime_factors(number).back;
	
	writeln(largest);
	
	return 0;
}

/**
 * Returns
 *	All prime factors of the specified number
 */
auto prime_factors(long number)
{
	int[] factors;
	
	for(int i = 2; i <= sqrt(number); ++i)
	{
		if(number % i == 0 && isprime(i))
			factors ~= i;
	}
	
	//return factors;
	return filter!("")(iota(2, number));
}

/**
 * check for prime
 * @link: http://www.d-programming-language.org/concepts.html
 */
bool isprime(int n) 
{ 
	if (n < 1 || (n & 1) == 0) 
		return false; 
	
	if (n > 3) 
	{ 
		for (auto i = 3; i * i < n; i += 2) 
		{ 
			if ((n % i) == 0) 
				return false; 
		} 
	} 
	
	return true; 
}

/**
 * Unit test for prime_factors
 */
unittest
{
	int[] result;
	
	result = prime_factors(9);
	
	assert(result.length == 1, "length of prime factors of 9 should be 1");
	assert(result == [3], "should be array of 1");
	assert(result.back == 3, "largest should be 3");
	
	// 
	result = prime_factors(13195);
	
	assert(result.length == 4, "length of prime factors of 13195 should be 4");
	assert(result == [5, 7, 13, 29], "should be array of 4");
	assert(result.back == 29, "largest should be 29");
}