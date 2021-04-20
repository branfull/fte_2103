class Item
  attr_reader :name,
              :price
  def initialize(item_information)
    @name = item_information[:name]
    @price = item_information[:price]
  end
end
