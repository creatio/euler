/**
 * euler_007.d
 * ```````````````````````````````````````````````````````````````````````````
 * By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see 
 * that the 6th prime is 13.
 * 
 * What is the 10001st prime number?
 * ```````````````````````````````````````````````````````````````````````````
 */
module euler_007;

import std.stdio;
import utils.utils;

int main(string[] argv)
{
	auto result = calculate_prime_to(10_001);
	
	writeln(result);
	
	return 0;
}

long calculate_prime_to(long term)
{
	auto nth = 0;
	auto prime = 0;

	for(auto i = 2;; ++i)
	{
		if(isprime(i))
		{
			++nth;
			prime = i;
			
			if(nth - 1 == term)
				break;
		}
	}
	
	return prime;
}

unittest
{
	assert(calculate_prime_to(6) == 13, "must equal 13");
}