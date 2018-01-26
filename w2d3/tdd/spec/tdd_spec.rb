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
  let(:towers) { game.towers }

  describe "#towers" do
    it "exposes game to @towers instance variable" do
      ivar = game.instance_variable_get(:towers)
      
      expect(ivar).to be(ivar)
    end

    it "stores discs as integers" do
      towers.each do |tower|
        expect(tower.all { |disc| disc.is_a?(Integer) }).to be_truthy
      end
    end

    it "stores as array of arrays (2d array)"
      expect(towers).to be_an_instance_of(Array)
      towers.each { |tower| expect(tower).to be_an_instance_of(Array) }
    end
  end
  
  describe "#initialize" do
    it "starts with all discs in first tower" do
      expects(towers.map(&:length)).to eq([3, 0, 0])
    end

    it "starts with correct pattern in first tower" do
      expects(towers.first).to eq([3, 2, 1])
    end
  end

  describe "#move(from_tower, to_tower)" do
    let!(:disc) { towers[0].last }
    before(:each) { game.move(0, 1) }
    
    it "Pops disk from tower" do
      expect(towers[0]).to eq([3, 2])
    end

    it "Pushes disk onto tower" do
      expect(towers[1]).to eq([1])
    end

    it "does not affect towers uninvolved" do
      expect(towers[2]).to be_empty
    end
  end

  describe "#won?" do
    context "if all disks are in 2nd or last tower" do
      it "return true" do
        [[0, 1], [0, 2], [1, 2], [0, 1], [2, 0], [2, 1], [0, 1]].each do |move|
          game.move(*move)
        end

        expect(game.won?).to be_truthy
      end
    end

    context "if game is incomplete" do
      it "return false" do
        [[0, 1], [0, 2], [1, 2]].each do |move|
          game.move(*move)
        end

        expect(game.won?).to be_falsey
      end
    end
  end
end