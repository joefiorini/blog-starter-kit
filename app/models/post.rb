require 'lib/string'

class Post < ActiveRecord::Base
  has_many :comments
  
  def body=(value)
    self[:body] = value.gsub("\n", "<br>")
  end
  
  def self.find_by_date(month)
    
    start_date, end_date = month.to_date_range

    find :all, :conditions => ["created_at between ? and ?", start_date, end_date], :order => 'created_at desc'
    
  end
end
