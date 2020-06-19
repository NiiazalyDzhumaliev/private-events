require 'rails_helper'

RSpec.describe Event, :type => :model do

  let(:user) {User.create(username: 'username')}
  let(:event) {user.events.create(desc: 'New Event', date: '2020-06-28')}

  context 'A created event should belong to a user as its creator' do
   it 'It should check for an event creator_id and return it' do
     expect(event.creator.username).to eq(user.username)
   end
 end
 
  context "Check for validation of event input" do
    it "is valid with valid attributes" do
      expect(Event.create).to_not be_valid
    end

    it "is not valid without a description" do
      expect(Event.new(desc: nil)).to_not be_valid
    end

    it "is not valid without a date" do
      expect(Event.new(date: nil)).to_not be_valid
    end
  end

  context 'ActiveRecord associations' do
    it 'belongs to creator' do
      expect(Event.reflect_on_association(:creator).macro).to be (:belongs_to)
    end
  end    
end
