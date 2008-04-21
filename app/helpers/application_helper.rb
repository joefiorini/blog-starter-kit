# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def format_date_long(date)
    date.strftime("%A, %B #{date.day.ordinalize}, %Y at %I:%M%p")
  end
  
  def format_date_short(date)
    date.to_s(:short_date_only)
  end

	def feedburner_link_tag(burned_name)
		auto_discovery_link_tag :rss, "http://feeds.feedburner.com/#{burned_name.to_s}", :title => 'faithfulgeek.org in syndication'
	end
end