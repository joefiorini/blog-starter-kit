# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def format_date_long(date)
    date.strftime("%A, %B #{date.day.ordinalize}, %Y at %I:%M%p")
  end
  
  def format_date_short(date)
    date.strftime("%D")
  end
end

# Move this to 'lib' once I find out how to load from 'lib'
module ActionView
	class Base
	
		def method_missing(symbol, *args)
      if symbol.to_s. =~ /_label$/
        self.class.instance_eval do

        define_method(symbol){
  				options = args[1] || {}
  				options = args[0] if args[0].class == Hash

  				prompt_char = options[:prompt_char] || ':'
  				is_required = options[:is_required] || false
  				required_char =  options[:required_char] || '*'
  				label_text = args[0].class == String ? args[0] : symbol.to_s.gsub(/_label/, '').to_friendly_name

  				label(:post, symbol.to_s.gsub(/_label/, ''), label_text) + (is_required ? required_char : '') + prompt_char
        }

        send symbol

        end

			end
			
		end

	end
	
end

class String
  def to_friendly_name
  	s = self.gsub(/[_]/, ' ')
  	ns = ""
  	s.each("\s"){|w| ns << w.capitalize }
  	return ns
  end
end