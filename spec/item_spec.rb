require './lib/item'

RSpec.describe Item do
  describe '#initialize' do
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    it 'exists' do
      expect(item1).to be_an_instance_of(Item)
    end
  end
end
