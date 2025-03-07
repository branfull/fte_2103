require './lib/event'
require './lib/food_truck'
require './lib/item'

RSpec.describe Event do
  describe '#initialize' do
    event = Event.new('South Pearl Street Farmers Market')
    it 'exists' do
      expect(event).to be_an_instance_of(Event)
    end
    it 'has a name' do
      expect(event.name).to eq('South Pearl Street Farmers Market')
    end
    it 'has food trucks' do
      expect(event.food_trucks).to eq([])
    end
  end
  describe '#add_food_truck' do
    event = Event.new('South Pearl Street Farmers Market')
    food_truck1 = FoodTruck.new('Rocky Mountain Pies')
    item1 = Item.new({name: 'Peach Pie (Slice)', price: '$3.75'})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: 'Peach-Raspberry Nice Cream', price: '$5.30'})
    item4 = Item.new({name: 'Banana Nice Cream', price: '$4.25'})
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new('Ba-Nom-a-Nom')
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new('Palisade Peach Shack')
    food_truck3.stock(item1, 65)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    it 'adds a food truck to the Event\'ts food_trucks array' do
      expect(event.food_trucks).to eq([food_truck1, food_truck2, food_truck3])
    end
  end
  describe '#food_truck_names' do
    event = Event.new('South Pearl Street Farmers Market')
    food_truck1 = FoodTruck.new('Rocky Mountain Pies')
    item1 = Item.new({name: 'Peach Pie (Slice)', price: '$3.75'})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: 'Peach-Raspberry Nice Cream', price: '$5.30'})
    item4 = Item.new({name: 'Banana Nice Cream', price: '$4.25'})
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new('Ba-Nom-a-Nom')
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new('Palisade Peach Shack')
    food_truck3.stock(item1, 65)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    it 'provides the names of all trucks in the food_trucks array' do
      expect(event.food_truck_names).to eq(['Rocky Mountain Pies', 'Ba-Nom-a-Nom', 'Palisade Peach Shack'])
    end
  end
  describe '#food_trucks_that_sell' do
    event = Event.new('South Pearl Street Farmers Market')
    food_truck1 = FoodTruck.new('Rocky Mountain Pies')
    item1 = Item.new({name: 'Peach Pie (Slice)', price: '$3.75'})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: 'Peach-Raspberry Nice Cream', price: '$5.30'})
    item4 = Item.new({name: 'Banana Nice Cream', price: '$4.25'})
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new('Ba-Nom-a-Nom')
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new('Palisade Peach Shack')
    food_truck3.stock(item1, 65)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    it 'provides list of all trucks that sell a given item' do
      expect(event.food_trucks_that_sell(item1)).to eq([food_truck1, food_truck3])
      expect(event.food_trucks_that_sell(item4)).to eq([food_truck2])
    end
  end
  describe '#list_of_all_food_items' do
    event = Event.new('South Pearl Street Farmers Market')
    food_truck1 = FoodTruck.new('Rocky Mountain Pies')
    item1 = Item.new({name: 'Peach Pie (Slice)', price: '$3.75'})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: 'Peach-Raspberry Nice Cream', price: '$5.30'})
    item4 = Item.new({name: 'Banana Nice Cream', price: '$4.25'})
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new('Ba-Nom-a-Nom')
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new('Palisade Peach Shack')
    food_truck3.stock(item1, 65)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    it 'provides a hash of items with quantity and trucks that sell that item' do
      expected = [item1, item2, item3, item4]
      expect(event.list_of_all_food_items.length).to eq(4)
    end
  end
  describe '#quantity_of_item' do
    event = Event.new('South Pearl Street Farmers Market')
    food_truck1 = FoodTruck.new('Rocky Mountain Pies')
    item1 = Item.new({name: 'Peach Pie (Slice)', price: '$3.75'})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: 'Peach-Raspberry Nice Cream', price: '$5.30'})
    item4 = Item.new({name: 'Banana Nice Cream', price: '$4.25'})
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new('Ba-Nom-a-Nom')
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new('Palisade Peach Shack')
    food_truck3.stock(item1, 65)
    food_truck3.stock(item3, 10)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    it 'provides a hash of items with quantity and trucks that sell that item' do
      expect(event.quantity_of_item(item1)).to eq(100)
      expect(event.quantity_of_item(item2)).to eq(7)
      expect(event.quantity_of_item(item3)).to eq(35)
      expect(event.quantity_of_item(item4)).to eq(50)
    end
  end
  describe '#total_inventory' do
    event = Event.new('South Pearl Street Farmers Market')
    food_truck1 = FoodTruck.new('Rocky Mountain Pies')
    item1 = Item.new({name: 'Peach Pie (Slice)', price: '$3.75'})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: 'Peach-Raspberry Nice Cream', price: '$5.30'})
    item4 = Item.new({name: 'Banana Nice Cream', price: '$4.25'})
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new('Ba-Nom-a-Nom')
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new('Palisade Peach Shack')
    food_truck3.stock(item1, 65)
    food_truck3.stock(item3, 10)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    it 'provides a hash of items with quantity and trucks that sell that item' do
      expected = {
        item1 => {
          quantity: 100,
          food_trucks: [food_truck1, food_truck3]
        },
        item2 => {
          quantity: 7,
          food_trucks: [food_truck1]
        },
        item3 => {
          quantity: 35,
          food_trucks: [food_truck2, food_truck3]
        },
        item4 => {
          quantity: 50,
          food_trucks: [food_truck2]
        }
      }
      expect(event.total_inventory).to eq(expected)
    end
  end
  describe '#overstocked_items' do
    event = Event.new('South Pearl Street Farmers Market')
    food_truck1 = FoodTruck.new('Rocky Mountain Pies')
    item1 = Item.new({name: 'Peach Pie (Slice)', price: '$3.75'})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: 'Peach-Raspberry Nice Cream', price: '$5.30'})
    item4 = Item.new({name: 'Banana Nice Cream', price: '$4.25'})
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new('Ba-Nom-a-Nom')
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new('Palisade Peach Shack')
    food_truck3.stock(item1, 65)
    food_truck3.stock(item3, 10)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    it 'an array of all items sold by more than 1 truck and greater than 50' do
      expect(event.overstocked_items).to eq([item1])
    end
  end
  describe '#sorted_item_list' do
    event = Event.new('South Pearl Street Farmers Market')
    food_truck1 = FoodTruck.new('Rocky Mountain Pies')
    item1 = Item.new({name: 'Peach Pie (Slice)', price: '$3.75'})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: 'Peach-Raspberry Nice Cream', price: '$5.30'})
    item4 = Item.new({name: 'Banana Nice Cream', price: '$4.25'})
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new('Ba-Nom-a-Nom')
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new('Palisade Peach Shack')
    food_truck3.stock(item1, 65)
    food_truck3.stock(item3, 10)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    it 'an array of all items sorted alphabetically' do
      expect(event.sorted_item_list).to eq([item2.name, item4.name, item1.name, item3.name])
    end
  end
end
