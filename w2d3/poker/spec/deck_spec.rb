require "deck"

describe Deck do
  subject(:deck) { Deck.new }
  let(:cards) { deck.cards }

  describe "#initialize" do
    it "creates array of cards" do
      ivar = deck.instance_variable_get(:@cards)
      
      expect(cards).to be(ivar)
    end

    it "starts with 52 cards" do
      expect(cards.length).to be(52)
    end
  end

  describe "#shuffle!" do
    it "make deck unique each time" do
      unshuffled = cards.dup
      shuffled = deck.shuffle!
      expect(unshuffled).not_to eq(shuffled)
    end
  end
end