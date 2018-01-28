require "card"
require "rspec"

describe Card do
  subject(:card) { Card.new(:spades, :ten) }

  describe "#initialize" do
    it "sets up card correctly" do
      expect(card.suit).to eq(:spades)
      expect(card.rank).to eq(:ten)
    end

    it "raises error with invalid suit" do
      expect do
        Card.new(:test, :ten)
      end.to raise_error
    end

    it "raises an error with an invalid value" do
      expect do
        Card.new(:spades, :ten)
      end.to raise_error
    end
  end

  describe "#<=>" do
    it "returns 0 when cards are the same" do
      expect(Card.new(:spades, :ten) <=> Card.new(:spades, :ten)).to eq(0)
    end

    it "returns 1 when card has higher value" do
      expect(Card.new(:spades, :ace) <=> Card.new(:spades, :ten)).to eq(1)
    end

    it "returns -1 when card has lower value" do
      expect(Card.new(:spades, :ten) <=> Card.new(:spades, :ace)).to eq(-1)
    end

    it "returns -1 when card has same value but lower suit" do
      expect(Card.new(:hearts, :ace) <=> Card.new(:spades, :ace)).to eq(-1)
    end
  end
end