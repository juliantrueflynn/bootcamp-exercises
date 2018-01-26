require "tdd"

describe Array do
  describe "#my_uniq" do
    let(:array) { [1, 1, 2, 3, 3, 3, 4, 5] }
    it "Removes duplicates from array" do
      expect(array.my_uniq).to eq([1, 2, 3, 4, 5])
    end

    it "Responds normally if there's no duplicates" do
      expect(array.my_uniq).to eq([1, 2, 3, 4, 5])
    end

    it "Does not call built-in #uniq method" do
      expect(array).not_to receive(:uniq)

      array.my_uniq
    end
  end

  describe "#two_sum" do
    it "Gets the sum of two numbers in array that equal zero, in order of index" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
  end
end

describe "#my_transpose" do
  it "Convert array between row-oriented and column-oriented representations"
end

describe "#stock_picker" do
  it "Takes array and outputs most profitable stock pairs"
end

describe "TowersOfHanoi" do
  subject(:game) { TowersOfHanoi.new }

  describe "#move" do
    it "Moves last item from array (tower) and moves to new array (tower)"
  end

  describe "#won?" do
    it "Determine if towers are in winning pattern"
  end
end