require "card"

describe Card do
  subject(:card) { Card.new }

  describe "#initialize" do
    it "exposes instance variable rank" do
      ivar = card.instance_variable_get(:@rank)

      expect(card.rank).to be(ivar)
    end

    it "exposes instance variable suit" do
      ivar = card.instance_variable_get(:@suit)

      expect(card.suit).to be(ivar)
    end
  end
end