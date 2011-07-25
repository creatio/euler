/**
 * utils.d
 */
module utils.utils;

import std.conv;
import std.stdio;

/** 
 */
int fibonacci(int limit)
{
	if(limit == 0 || limit == 1)
		return 1;
	
	return fibonacci(limit - 1) + fibonacci(limit - 2);
}

unittest 
{
	int result = -1;
	
	// we test value 1
	result = fibonacci(1);
	assert(result == 1, "result should equal 1");
	
	// we test value 1
	result = fibonacci(6);
	assert(result == 13, "result should equal 13");
	
	// we test value 10
	result = fibonacci(10);
	assert(result == 89, "result should equal 89");
}

/**
 * check for prime
 * @link: http://www.d-programming-language.org/concepts.html
 */
bool isprime(long n)
{
	if (n < 1 || ((n & 1) == 0 && n != 2)) 
		return false; 
	
	if (n > 3) 
	{
		for (auto i = 3; i * i <= n; i += 2) 
		{ 
			if ((n % i) == 0) 
				return false; 
		}
	}
	
	return true; 
}

unittest 
{
	assert(isprime(2) == true);
	assert(isprime(43) == true);
	assert(isprime(97) == true);	
}

/**
 */

bool ispalindrome(T)(T v)
	if(is(typeof(v) == string) || is(typeof(v) == int) || is(typeof(v) == long))
{
	auto n = to!string(v);
	return n == n.dup.reverse;
}

unittest
{
}