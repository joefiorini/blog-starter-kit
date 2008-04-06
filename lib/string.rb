class String
  def to_friendly_name
  	s = self.gsub(/[_]/, ' ')
  	ns = ""
  	s.each("\s"){|w| ns << w.capitalize }
  	return ns
  end
  
  def to_month_number
    Date::MONTHNAMES.index(self)
  end
  
  def to_date_range
    
    if(self.to_month_number > DateTime.now.month)
      year = 1.year.ago.year
    else
      year = DateTime.now.year
    end
    
    start_date = DateTime.new(year, self.to_month_number, 1).to_time
    end_date = start_date.at_end_of_month
    
    return start_date, end_date
  end
  
  def previous_month
    index = Date::MONTHNAMES.index(self) - 1
    index = 12 if index == 0
    Date::MONTHNAMES[index]
  end
end