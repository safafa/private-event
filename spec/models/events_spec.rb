require 'rails_helper'

RSpec.describe Event, type: :model do
  before :each do
    User.create(email: 'safa@gmail.com', password: '123456', username: 'safa')
  end
  after :each do
    User.destroy(1)
  end
  context 'Create event' do
    it 'create a new event' do
      event = Event.new(creator_id: 1, name: 'first', date: '10-06-21', location: 'Rabat')
      expect(event.save).to eq true
    end

    it 'should not create event without user' do
      event = Event.new(name: 'Event', date: '06-06-21', location: 'Rabat')
      expect(event.save).to be(false)
    end
  end
end
