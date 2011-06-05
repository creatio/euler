/**
 * euler_004.d
 * ```````````````````````````````````````````````````````````````````````````
 * A palindromic number reads the same both ways. The largest palindrome made 
 * from the product of two 2-digit numbers is 9009 = 91 x 99.
 * Find the largest palindrome made from the product of two 3-digit numbers.
 * ```````````````````````````````````````````````````````````````````````````
 */
module euler_004;

import std.conv;
import std.stdio;
import std.algorithm;

int main(string[] argv)
{
	writeln(largest_palindromic_number(100, 999));
	
	return 0;
}

long largest_palindromic_number(int a, int b)
{
	auto largest = -1;
	auto limit = b + 1;
	foreach(n; a .. limit)
	{
		foreach(m; a .. limit)
		{
			auto mult = n * m;
			if(ispalindrome(mult))
				largest = max(mult, largest);
		}
	}
	
	return largest;
}

bool ispalindrome(T)(T v)
	if(is(typeof(v) == string) || is(typeof(v) == int) || is(typeof(v) == long))
{
	auto n = to!string(v);
	return n == n.dup.reverse;
}