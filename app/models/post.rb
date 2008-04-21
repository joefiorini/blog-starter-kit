class Post < ActiveRecord::Base
  acts_as_commentable :order => 'created_at desc'

end
