class EventAttendance < ApplicationRecord
    belongs_to :event_attendee, class_name: "User"
    belongs_to :attended_event, class_name: "Event" 

    validates_presence_of :attended_event_id
    validates_presence_of :event_attendee_id

end
