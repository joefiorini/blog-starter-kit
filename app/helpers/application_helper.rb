# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def format_date_long(date)
    date.strftime("%A, %B #{date.day.ordinalize}, %Y at %I:%M%p")
  end
  
  def format_date_short(date)
    date.to_s(:short_date_only)
  end
end