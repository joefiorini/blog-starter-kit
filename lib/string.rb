class String
  def to_friendly_name
  	s = self.gsub(/[_]/, ' ')
  	ns = ""
  	s.each("\s"){|w| ns << w.capitalize }
  	return ns
  end
  
end