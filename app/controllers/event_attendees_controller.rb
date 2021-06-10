class EventAttendeesController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    if EventAttendee.where(attendee_id: current_user.id, attended_event_id: params[:event_id]).exists?
      redirect_to event_path(event)
      return
    end
    @event_attendee = event.event_attendees.build(attendee_id: current_user.id)
    redirect_to event_path(event) if @event_attendee.save
  end
end
