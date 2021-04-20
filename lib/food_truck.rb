class FoodTruck
  attr_reader :name,
              :inventory
  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory[item] == nil
      0
    else
      @inventory[item]
    end
  end

  def stock(item, quantity)
    # require 'pry'; binding.pry
    if @inventory[item] == nil
      @inventory[item] = quantity
    else
      @inventory[item] += quantity
    end
  end

  # refactor if time allows
  def potential_revenue
    @inventory.sum do |item, quantity|
      item.price.slice(1..-1).to_f * quantity
    end
  end
end
