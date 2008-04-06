require 'lib/string'

class Post < ActiveRecord::Base
  has_many :comments
  
  def body=(value)
    self[:body] = value.gsub("\n", "<br>")
  end
  
end
