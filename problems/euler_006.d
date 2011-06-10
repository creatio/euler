/**
 * euler_006.d
 * ```````````````````````````````````````````````````````````````````````````
 * The sum of the squares of the first ten natural numbers is,
 *			1^2 + 2^2 + ... + 10^2 = 385
 *
 * The square of the sum of the first ten natural numbers is,
 *			(1 + 2 + ... + 10)^2 = 55^2 = 3025
 * 
 * Hence the difference between the sum of the squares of the first ten 
 * natural numbers and the square of the sum is 3025 - 385 = 2640.
 * 
 * Find the difference between the sum of the squares of the first one 
 * hundred natural numbers and the square of the sum.
 * ```````````````````````````````````````````````````````````````````````````
 */
module euler_006;

import std.math;
import std.range;
import std.stdio;
import std.algorithm;

int main(string[] argv)
{
	writeln(diff_ssq_sqs(100));
	return 0;
}

long diff_ssq_sqs(int max)
{
	return square_of_sum(max) - sum_of_squares(max);
}

unittest
{
	assert(diff_ssq_sqs(10) == 2640, "should equal 2640");
}

/**
 * starts from 1
 * @link http://en.wikipedia.org/wiki/Square_pyramidal_number
 */
long sum_of_squares(int max)
{
	return reduce!("a + b * b")(0, iota(1, max + 1));
}

unittest
{
	assert(55 == sum_of_squares(5), "should equal 55");
	assert(385 == sum_of_squares(10), "should equal 385");
}

/**
 * starts from 1
 */
long square_of_sum(int max)
{
	auto sum = reduce!("a + b")(iota(1, max + 1));	
	return pow(sum, 2);
}

unittest
{
	assert(3025 == square_of_sum(10), "should equal 3025");
}