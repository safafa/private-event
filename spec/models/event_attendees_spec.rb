require 'rails_helper'

RSpec.describe EventAttendee, type: :model do
  context 'Add attendees to event' do
    it 'create new entry' do
      event = Event.new(creator_id: 1, name: 'first', date: '10-06-21', location: 'Rabat')
      event.save
      user = User.new(username: 'Safa', email: 'cc@gmail.com', password: '123456',
                      password_confirmation: '123456')
      user.save
      event_att = event.event_attendees.build(attendee_id: user.id)
      event_att.save
      expect(event_att.attendee.username).to eq 'Safa'
    end

    it 'should not create entry without attendee' do
      event_att = EventAttendee.new(attended_event_id: 1)
      expect(event_att.save).to eq false
    end

    it 'should not create entry without attended_event' do
      event_att = EventAttendee.new(attendee_id: 1)
      expect(event_att.save).to eq false
    end
  end
end
