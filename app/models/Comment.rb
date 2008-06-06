require 'vendor/plugins/acts_as_commentable/lib/Comment'
class Comment
	has_rakismet :author => 'name',
								:author_email => 'email',
								:author_url => 'url',
								:content => 'comment'

	def comment_type
		"Comment"
	end
	
	def after_validation
		unless self.comment_something.empty?
			self.spam_type = "honeypot"
		else
			self.spam_type = ""
		end
		
		if self.spam_type.empty? and self.spam?
			self.spam_type = "rakismet"
		else
			self.spam_type = ""
		end
		
		self.is_spam = !self.spam_type.empty?
		
	end
	
end