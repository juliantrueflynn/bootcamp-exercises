def sum_to(num)
	if num == 1
		num
	elsif num < 0
		nil
	else
		num + sum_to(num - 1)
	end
end

def add_numbers(nums_arr)
	return nil if nums_arr.length == 0
	return nums_arr[0] if nums_arr.length == 1
	nums_arr[1] += nums_arr[0]
	nums_arr.shift
	add_numbers(nums_arr)
end

def gamma_fnc(num)
	return nil if num == 0
	return num if num == 1
	gamma_fnc(num - 1 * num - 1)
end

def ice_cream_shop(flavors, favorite)
	return false if flavors.empty?

	if flavors[0] == favorite
		return true
	else
		ice_cream_shop(flavors[1..-1], favorite)
	end
end

def reverse(str)
	return "" if str.length == 0
	return str if str.length == 1
	str[-1] + reverse(str[0..-2])
end
