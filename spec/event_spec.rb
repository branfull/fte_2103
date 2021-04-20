require './lib/event'

RSpec.describe Event do
  describe '#initialize' do
    event = Event.new("South Pearl Street Farmers Market")
    it 'exists' do
      expect(event).to be_an_instance_of(Event)
    end
  end
end
