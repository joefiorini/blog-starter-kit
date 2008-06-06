class Post < ActiveRecord::Base
	belongs_to :author, :class_name => 'User'
	before_save :generate_permalink
  acts_as_commentable :order => 'created_at desc', :conditions => "is_spam = 'f'"
	acts_as_taggable

	def generate_permalink
		#raise self.attributes.to_s
		if self.permalink.nil?
			self.permalink = self.title.sanitize_for_url
			self.save
		end
	end

end
