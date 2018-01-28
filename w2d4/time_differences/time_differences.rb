# O(n^2) quadratic time
# O(n^2) quadratic space
def my_min_p1(nums)
  nums.each_with_index do |n1, i|
    return n1 unless nums[i + 1..-1].any? { |n2| n1 > n2 }
  end
end

# O(n^2) quadratic time
# O(1) quadratic space
def my_min_p2(nums)
  nums.each_with_index do |n1, i1|
    min = true
    nums.each_with_index do |n2, i2|
      next if i1 == i2
      min = false if n1 > n2
    end

    return n1 if min
  end
end