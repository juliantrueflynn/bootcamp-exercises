class Stack
	def initialize(stack = [])
		@stack = stack
	end

	def add(el)
		@stack << el
		el
	end

	def remove
		@stack.pop
	end

	def show
		@stack.dup
	end
end

class Queue
	def initialize(queue = [])
		@queue = queue
	end

	def enqueue(el)
		@queue << el
		el
	end

	def dequeue
		@queue.shift
	end

	def show
		@queue.dup
	end
end

# Not allowed to use Ruby Hash. Must be 2D array!
class Map
	def initialize()
		@map = []
	end

	def assign(key, value)
		pair_index = @map.index {|pair| pair[0] == key}
		pair_index ? @map[pair_index][1] = value : @map.push([key, value])
		[key, value]
	end

	def lookup(key)
		@map.each {|pair| return pair[1] if pair[0] == key}
		nil
	end

	def remove(key)
		@map.reject! {|pair| pair[0] == key}
		nil
	end

	def show
		@map.dup
	end
end
