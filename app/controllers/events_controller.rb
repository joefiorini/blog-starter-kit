class EventsController < ResourceController::Base
  def load_collection
    @events = Event.old :limit => 12, :order => 'start_time desc'
  end
end
