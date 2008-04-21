module PostsHelper
	def textilize(value)
		value = value.body if value.respond_to?(:body)
		RedCloth.new(h(value)).to_html
	end
end
