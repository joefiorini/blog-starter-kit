class Event < Post
  belongs_to :location
  validates_presence_of :start_time
  validates_presence_of :location
end