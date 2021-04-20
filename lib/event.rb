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
end
