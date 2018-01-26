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
end