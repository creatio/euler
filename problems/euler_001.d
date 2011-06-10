/**
 * euler_001.d
 * ```````````````````````````````````````````````````````````````````````````
 * If we list all the natural numbers below 10 that are multiples of 3 or 5, 
 * we get 3, 5, 6 and 9. 
 * The sum of these multiples is 23. 
 * 
 * Find the sum of all the multiples of 3 or 5 below 1000.
 * ```````````````````````````````````````````````````````````````````````````
 */
module euler_001;

import std.stdio;
import std.range;
import std.algorithm;

int main(string[] argv)
{
	writeln("find the sum of all the multiples of 3 or 5 below 1000");
	
	auto result = sum_mulitple_three_five(1000);
	writeln(result);
			
	return 0;
}

int sum_mulitple_three_five(int limit)
{
	auto three_five = filter!("a % 3 == 0 || a % 5 == 0")(iota(0, limit));
	return reduce!("a + b")(three_five);
}

unittest
{
	auto result = sum_mulitple_three_five(10);
	assert( result == 23, "sum multiple below 10 is not equal to 23" );
}