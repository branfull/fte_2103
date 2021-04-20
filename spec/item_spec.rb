require './lib/item'

RSpec.describe Item do
  describe '#initialize' do
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    it 'exists' do
      expect(item2).to be_an_instance_of(Item)
    end
    it 'has a name' do
      expect(item2.name).to eq('Apple Pie (Slice)')
    end
    it 'has a price' do
      expect(item2.price).to eq('$2.50')
    end
  end
end
