require 'vendor/plugins/acts_as_commentable/lib/Comment'
class Comment
	has_rakismet :author => 'name',
								:author_email => 'email',
								:author_url => 'url',
								:content => 'comment'
	
	def comment_type
		"Comment"
	end
	
	def before_create
		!self.spam?
	end
	
end