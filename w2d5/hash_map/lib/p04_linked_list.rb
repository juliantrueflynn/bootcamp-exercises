include Enumerable

class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    count = 0
    current_node = first
    until current_node == @tail
      return current_node if i == count
      current_node = current_node.next
      count += 1
    end

    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    first == @tail
  end

  def get(key)
    current_node = first
    until current_node == @tail
      return current_node.val if current_node.key == key
      current_node = current_node.next
    end

    nil
  end

  def include?(key)
    current_node = first
    until current_node == @tail
      return true if current_node.key == key
      current_node = current_node.next
    end

    false
  end

  def append(key, val)
    old_node = last
    new_node = Node.new(key, val)
    new_node.next = @tail
    new_node.prev = last
    old_node.next = new_node    
    @tail.prev = new_node
  end

  def update(key, val)
    return unless include?(key)

    current_node = first
    until current_node == @tail
      current_node.val = val if current_node.key == key
      current_node = current_node.next
    end
  end

  def remove(key)
    return unless include?(key)

    current_node = first
    until current_node == @tail
      if current_node.key == key
        prev_node = current_node.prev
        next_node = current_node.next
        prev_node.next = next_node
        next_node.prev = prev_node        
      end

      current_node = current_node.next
    end
  end

  def each(&prc)
    current_node = first
    until current_node == @tail
      prc.call(current_node)
      current_node = current_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
