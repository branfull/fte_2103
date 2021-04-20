require './lib/food_truck'

RSpec.describe FoodTruck do
  describe '#initialize' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    it 'exists' do
      expect(food_truck).to be_an_instance_of(FoodTruck)
    end
  end
end
