require 'rails_helper'

RSpec.describe EventAttendance, :type => :model do
    context "Check for validation of Event attendance input" do
        it "is valid with valid attributes" do
          expect(EventAttendance.create).to_not be_valid
        end
    
        it "is not valid without a event_id" do
          expect(EventAttendance.new(event_attendee_id: nil)).to_not be_valid
        end
    
        it "is not valid without a attendee_id" do
          expect(EventAttendance.new(attended_event_id: nil)).to_not be_valid
        end
      end
end
