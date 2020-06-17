class Event < ApplicationRecord
    # require "date" 
    belongs_to :creator, class_name: "User"
    has_many :event_attendances, foreign_key: :attended_event_id
    has_many :attendees, through: :event_attendances, source: :event_attendee

    scope  :upcoming_events, -> { where('date >= ?', Date.today) }
    scope  :previous_events, -> { where('date < ?', Date.today) }
end
