require 'rspec'
require 'dessert'


describe Dessert do
  let(:chef) { double("chef", :titleize => "Chef Gucci") }
  subject(:dessert) { Dessert.new("cake", 4, chef) }
  
  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("cake")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(4)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect do
        Dessert.new("cake", "4", chef)
      end.to raise_error
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("milk")
      
      expect(dessert.ingredients.count).to eq(1)
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.add_ingredient("milk")
      dessert.add_ingredient("eggs")
      
      expect(dessert.mix!).to eq(dessert.ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(1)
      
      expect(dessert.quantity).to eq(3)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect do
        dessert.eat(5)
      end.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(chef.titleize).to eq("Chef Gucci")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)

      dessert.make_more
    end
  end
end