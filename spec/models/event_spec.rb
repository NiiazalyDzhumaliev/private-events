require 'rails_helper'

RSpec.describe Event, :type => :model do

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
