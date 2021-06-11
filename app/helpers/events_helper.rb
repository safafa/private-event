module EventsHelper
  def upcoming?(event)
    event.date > DateTime.now
  end
end
