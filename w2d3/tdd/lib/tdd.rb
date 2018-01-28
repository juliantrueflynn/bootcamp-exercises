class Array
  def my_uniq
    uniques = []
    self.each do |item|
      uniques << item unless uniques.include?(item)
    end

    uniques
  end
end