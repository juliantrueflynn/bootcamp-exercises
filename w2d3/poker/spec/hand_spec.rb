require "hand"
require "card"
require "rspec"

describe Hand do
  let(:cards) do
    [
      Card.new(:spades, :jack),
      Card.new(:spades, :ten),
      Card.new(:hearts, :eight),
      Card.new(:clovers, :six),
      Card.new(:diamonds, :two),
    ]
  end
  subject(:hand) { Hand.new(cards) }

  describe "#initialize" do
    it "introduces @cards instance variable" do
      expect(hand.cards).to eq(cards)
    end

    it "initializes with 5 cards" do
      expect(hand.cards.count).to eq(5)
    end
  end

  describe "playing hands rank" do
    let(:straight_flush) do
      Hand.new([
        Card.new(:spades, :jack),
        Card.new(:spades, :ten),
        Card.new(:spades, :nine),
        Card.new(:spades, :eight),
        Card.new(:spades, :seven),
      ])
    end
    
    let(:four_of_a_kind) do
      Hand.new([
        Card.new(:spades, :queen),
        Card.new(:hearts, :queen),
        Card.new(:clovers, :queen),
        Card.new(:diamonds, :queen),
        Card.new(:spades, :three),
      ])
    end
    
    let(:full_house) do
      Hand.new([
        Card.new(:spades, :ten),
        Card.new(:hearts, :ten),
        Card.new(:clovers, :ten),
        Card.new(:spades, :two),
        Card.new(:hearts, :two),
      ])
    end
    
    let(:flush) do
      Hand.new([
        Card.new(:spades, :king),
        Card.new(:spades, :jack),
        Card.new(:spades, :nine),
        Card.new(:spades, :three),
        Card.new(:spades, :two),
      ])
    end
    
    let(:straight) do
      Hand.new([
        Card.new(:spades, :queen),
        Card.new(:diamonds, :jack),
        Card.new(:hearts, :ten),
        Card.new(:spades, :nine),
        Card.new(:clovers, :eight),
      ])
    end
    
    let(:three_of_a_kind) do
      Hand.new([
        Card.new(:spades, :jack),
        Card.new(:hearts, :jack),
        Card.new(:diamonds, :jack),
        Card.new(:spades, :three),
        Card.new(:clovers, :two),
      ])
    end
    
    let(:two_pair) do
      Hand.new([
        Card.new(:spades, :jack),
        Card.new(:hearts, :jack),
        Card.new(:spades, :two),
        Card.new(:clovers, :two),
        Card.new(:diamonds, :four),
      ])
    end
    
    let(:one_pair) do
      Hand.new([
        Card.new(:hearts, :six),
        Card.new(:diamonds, :six),
        Card.new(:clovers, :four),
        Card.new(:diamonds, :three),
        Card.new(:spades, :two),
      ])
    end

    let(:high_card) do
      Hand.new([
        Card.new(:spades, :ten),
        Card.new(:spades, :nine),
        Card.new(:diamonds, :six),
        Card.new(:hearts, :four),
        Card.new(:spades, :two),
      ])
    end

    describe "#hand_rank" do
      let(:ranks) do
        :straight_flush,
        :four_of_a_kind,
        :full_house,
        :flush,
        :straight,
        :three_of_a_kind,
        :two_pair,
        :one_pair,
        :high_hard,
      end

      
    end
  end
end