class Post < ActiveRecord::Base
  acts_as_commentable :order => 'created_at desc'
  
  def body=(value)
    self[:body] = value.gsub("\n", "<br>")
  end
  
end
