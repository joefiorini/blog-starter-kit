class Post < ActiveRecord::Base
  acts_as_commentable
  
  def body=(value)
    self[:body] = value.gsub("\n", "<br>")
  end
  
end
