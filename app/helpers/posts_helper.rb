module PostsHelper
	def textilize(value)
		value = value.body if value.respond_to?(:body)
		RedCloth.new(value, [:filter_html, :filter_styles]).to_html
	end
end
