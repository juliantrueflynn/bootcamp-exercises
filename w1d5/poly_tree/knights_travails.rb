require_relative "lib/00_tree_node"
require "byebug"

class KnightPathFinder
	def initialize(start_pos)
		@start_pos = start_pos
		@visited_positions = [start_pos]

		build_move_tree
	end

	def self.valid_moves(pos)
		x, y = pos
		moves = []

		if (x + 2).between?(0, 7)
			if (y + 1).between?(0, 7)
				moves << [x + 2, y + 1]
			end

			if (y - 1).between?(0, 7)
				moves << [x + 2, y - 1]
			end
		end

		if (x - 2).between?(0, 7)
			if (y + 1).between?(0, 7)
				moves << [x - 2, y + 1]
			end

			if (y - 1).between?(0, 7)
				moves << [x - 2, y - 1]
			end
		end

		if (y + 2).between?(0, 7)
			if (x + 1).between?(0, 7)
				moves << [x + 1, y + 2]
			end

			if (x - 1).between?(0, 7)
				moves << [x - 1, y + 2]
			end
		end

		if (y - 2).between?(0, 7)
			if (x + 1).between?(0, 7)
				moves << [x + 1, y - 2]
			end

			if (x - 1).between?(0, 7)
				moves << [x - 1, y - 2]
			end
		end

		moves
	end

	def find_path(end_pos)
		end_node = root_node.dfs(end_pos)
		trace_path_back(end_node).reverse.map(&:value)
	end

	private

	attr_accessor :root_node

	def build_move_tree
		self.root_node = PolyTreeNode.new(@start_pos)
		nodes = [root_node]
		until nodes.empty?
			current_node = nodes.shift
			current_pos = current_node.value
			new_move_positions(current_pos).each do |next_pos|
				next_node = PolyTreeNode.new(next_pos)
				current_node.add_child(next_node)
				nodes << next_node
			end
		end
	end

	def new_move_positions(pos)
		KnightPathFinder.valid_moves(pos)
			.reject { |new_pos| @visited_positions.include?(new_pos) }
			.each { |new_pos| @visited_positions << new_pos }
	end
end

def trace_path_back(end_node)
	nodes = []

	current_node = end_node
	until current_node.nil?
		nodes << current_node
		current_node = current_node.parent
	end

	nodes
end

if __FILE__ == $PROGRAM_NAME
	kpf = KnightPathFinder.new([0, 0])
	kpf.find_path([7, 6])
end
