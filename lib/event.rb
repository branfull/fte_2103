class Event
  attr_reader :name,
              :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks.push(food_truck)
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  # refactor if time allows
  def food_trucks_that_sell(item_in_question)
    array = []
    @food_trucks.each do |food_truck|
      food_truck.inventory.keys.each do |item|
        if item == item_in_question
          array.push(food_truck)
        end
      end
    end
    array
  end

  def list_of_all_food_items
    array = @food_trucks.map do |truck|
      truck.inventory.keys
    end.flatten.uniq
  end

  def quantity_of_item(item)

    @food_trucks.sum do |truck|
      truck.check_stock(item)
    end

  end

  def total_inventory
    list_of_all_food_items.inject({}) do |hash, item|
      hash[item] = {quantity: quantity_of_item(item), food_trucks: food_trucks_that_sell(item)}
      hash
    end
  end

  def overstocked_items
    list_of_all_food_items.find_all do |item|
      food_trucks_that_sell(item).length > 1 &&
      quantity_of_item(item) > 50
    end
  end

  def sorted_item_list
    item_names = list_of_all_food_items.map do |item|
      item.name
    end
    item_names.sort
  end
end
