class LRUCache
  def initialize(cache_limit)
    @cache_limit = cache_limit
    @nodes = []
  end

  def count
    @nodes.length
  end

  def add(el)
    @nodes.delete(el) if @nodes.include?(el)
    @nodes << el
    @nodes.shift if count > @cache_limit
    el
  end

  def show
    print @nodes
  end
end