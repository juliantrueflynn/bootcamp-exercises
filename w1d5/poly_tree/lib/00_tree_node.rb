require "byebug"

class PolyTreeNode
	attr_reader :parent, :children

	def initialize(value)
		@value = value
		@parent = nil
		@children = []
	end

	def value
		@value
	end

	def parent=(node_value)
		prev_parent = parent

		@parent = node_value
		return nil if @parent.nil?
		parent_childs = @parent.children
		parent_childs << self unless parent_childs.any? { |node| node == self }

		prev_parent.children.delete(self) if !prev_parent.nil? && prev_parent != @parent
	end

	def add_child(child_node)
		child_node.parent = self
	end

	def remove_child(child_node)
		child_node.parent.children.delete(child_node)
		child_node.parent = nil
	end

	def dfs(target)
		return nil if children.nil?
		return self if target == value

		children.each do |child|
			search_result = child.dfs(target)
			return search_result unless search_result.nil?
		end
		nil
	end

	def inspect
		{ 'id' => self.object_id, 'value' => @value, 'parent_value' => @parent.value }.inspect
	end

	def bfs(target)
		nodes = [self]
		until nodes.empty?
			node = nodes.shift

			return node if node.value == target
			nodes.concat(node.children)
		end

		nil
	end
end
