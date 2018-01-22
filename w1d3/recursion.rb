require "byebug"

def range(min, max)
	return [] if max <= min
	range(min, max - 1) << max - 1
end

def sum_arr(arr)
	return arr[0] if arr.length == 1
	arr[1] += arr[0]
	arr.shift
	sum_array(arr)
end

def sum_arr_iterative(arr)
	arr.reduce(:+)
end

def fib(n)
	if n <= 2
		[0, 1].take(n)
	else
		fibs = fib(n - 1)
		fibs << fibs[-2] + fibs[-1]
	end
end

def exponent_1(base, power)
	return power if power == 0
	base * exponent_1(base, power - 1)
end

class Array
	def subsets
		return [[]] if self.empty?
		subsets << self.drop(1)
	end
end

def bsearch(nums, target)
	return nil nums.empty?

	mid_idx = nums.length / 2

	case target <=> nums[mid_idx]
	when -1

	when 0
		mid_idx
	when 1

	end
end

bsearch([1, 2, 3, 4], 1) # => 0
p bsearch([1, 2, 3, 4, 5, 7], 6)
