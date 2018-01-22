require 'pry'
require 'byebug'

class Array
	def my_each(&block)
		i = 0
		while i < self.length
			block.call(self[i]) unless block.nil?
			i += 1
		end
		self
	end

	def my_select(&block)
		selected = []
		self.my_each do |num|
			selected << num if block.call(num)
		end
		selected
	end

	def my_reject(&block)
		selected = []
		self.my_each do |num|
			selected << num unless block.call(num)
		end
		selected
	end

	def my_any?(&block)
		matched = false
		self.my_each do |num|
			if block.call(num)
				block.call(num)
				matched = true
			end
		end
		matched
	end

	def my_all?(&block)
		self.my_each do |num|
			return false unless block.call(num)
		end
		true
	end

	def my_flatten(temp_array = [])
		self.my_each do |level|
			if level.is_a?(Array)
				level.my_flatten(temp_array)
			else
				temp_array << level
			end
		end
		temp_array
	end

	def my_zip(*nums)
		col_len = self.length
		row_len = nums.length
		zipped = []
		i = 0
		while i < col_len
			sub_i = 0
			zip_temp = []
			while sub_i < 1
				zip_temp << self[i]
				sub_i += 1
			end
			zipped << zip_temp
			i += 1
		end

		i = 0
		while i < col_len
			sub_i = 0
			while sub_i < row_len
				zipped[i] << nums[sub_i][i]
				sub_i += 1
			end
			i += 1
		end

		zipped
	end

	def my_rotate(rotates = 1)
		temp = self
		i = 0
		while i < rotates
			sub_i = 0
			while sub_i < self.length
				temp << temp[0]
				temp << temp[0]
				temp.shift
				sub_i += 1
			end
			i += 1
		end
		temp
	end

	def my_join(sep = "")
		joined = ""
		i = 0
		while i < self.length
			joined << self[i]
			joined << sep unless i + 1 == self.length
			i += 1
		end
		joined
	end

	def my_reverse
		temp = []
		i = self.length
		while 0 < i
			i -= 1
			temp << self[i]
		end
		temp
	end
end

def factors(num)
	i = 1
	matched = []
	while i <= num
		matched << i if num % i == 0
		i += 1
	end
	matched
end

a = [ "a", "b", "c", "d" ]
p a.my_rotate         #=> ["b", "c", "d", "a"]
p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
p a.my_rotate(15)     #=> ["d", "a", "b", "c"]
