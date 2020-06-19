class AddTwoToEventAttendances < ActiveRecord::Migration[6.0]
  def change
    add_column :event_attendances, :event_attendee_id, :integer
    add_column :event_attendances, :attended_event_id, :integer
  end
end
