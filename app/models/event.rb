class Event < Post
  belongs_to :location
  validates_presence_of :start_time
  validates_presence_of :location
  named_scope :old, :conditions => ['start_time < ?', DateTime.now]
end