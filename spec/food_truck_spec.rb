require './lib/food_truck'
require './lib/item'

RSpec.describe FoodTruck do
  describe '#initialize' do
    food_truck = FoodTruck.new('Rocky Mountain Pies')
    it 'exists' do
      expect(food_truck).to be_an_instance_of(FoodTruck)
    end
    it 'has a name' do
      expect(food_truck.name).to eq('Rocky Mountain Pies')
    end
    it 'has an inventory' do
      expect(food_truck.inventory).to eq({})
    end
  end
  describe 'check_stock' do
    food_truck = FoodTruck.new('Rocky Mountain Pies')
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    it 'returns 0 if an item is has not been stocked' do
      expect(food_truck.check_stock(item1)).to eq(0)
    end
  end
end
