require 'rails_helper'

RSpec.describe EventAttendance, type: :model do
  let(:user) { User.create(username: 'username') }
  let(:event) { user.events.create(desc: 'New Event', date: '2020-06-28') }

  context 'A created event should belong to a user as its creator' do
    it 'It should check for an event creator_id and return it' do
      expect(event.creator.username).to eq(user.username)
    end
  end

  context 'Check for validation of Event attendance input' do
    it 'is valid with valid attributes' do
      expect(EventAttendance.create).to_not be_valid
    end

    it 'is not valid without a event_id' do
      expect(EventAttendance.new(event_attendee_id: nil)).to_not be_valid
    end

    it 'is not valid without a attendee_id' do
      expect(EventAttendance.new(attended_event_id: nil)).to_not be_valid
    end
  end
end
