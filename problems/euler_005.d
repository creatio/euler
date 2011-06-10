/**
 * euler_005.d
 * ```````````````````````````````````````````````````````````````````````````
 * 2520 is the smallest number that can be divided by each of the numbers 
 * from 1 to 10 without any remainder.
 *
 * What is the smallest positive number that is evenly divisible by all of 
 * the numbers from 1 to 20?
 * ```````````````````````````````````````````````````````````````````````````
 */
module euler_005;

import std.conv;
import std.stdio;

int main(string[] argv)
{
	auto result = smallest_number_divisible_by_range(1, 20);
	
	writeln(result);
	
	return 0;
}

int smallest_number_divisible_by_range(int min, int max)
{
	auto num = -1;

	for(auto i = 2; ; ++i)
	{
		auto j = max * i;
		auto divisible = false;

		foreach(n; min .. max)
		{
			divisible = (j % n != 0);
			
			if(divisible)
				break;
		}
		
		if(!divisible)
		{
			num = j;
			break;
		}
	}
	
	return num;
}

unittest
{
	auto result = smallest_number_divisible_by_range(1, 4);
	assert(12 == result, "the answer should equal 12");

	result = smallest_number_divisible_by_range(1, 10);
	assert(2520 == result, "the answer should equal 2520");
}