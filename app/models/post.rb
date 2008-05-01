class Post < ActiveRecord::Base
	belongs_to :author, :class_name => 'User'
  acts_as_commentable :order => 'created_at desc'
	acts_as_taggable

end
