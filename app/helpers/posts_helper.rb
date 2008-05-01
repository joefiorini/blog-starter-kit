module PostsHelper
	def textilize(value)
		value = value.body if value.respond_to?(:body)
		RedCloth.new(value, [:filter_html, :filter_styles]).to_html
	end
	
	def tags_for(post)
		tags = post.tag_list.map do |t|
			link_to t, tag_url(t)
		end
		tags.join " &ndash; "
	end
end
