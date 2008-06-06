class String
	
	def sanitize_for_url
		s = String.new self
		s.gsub! /[[:punct:]]*$/, ''
		s.gsub! /_+/, ' '
		s.gsub! /[[:punct:]]+/, '-'
		s.gsub! /\s/, '_'
		s
	end

end