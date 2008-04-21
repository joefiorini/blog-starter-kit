module ActionView
	class Base
		
		def method_missing(symbol, *args)
      if symbol.to_s. =~ /_label$/
        self.class.instance_eval do
	
					return if method_defined? symbol

					define_method(symbol){
	  				options = args[1] || {}
	  				options = args[0] if args[0].class == Hash

	  				prompt_char = options[:prompt_char] || ':'
	  				is_required = options[:is_required] || false
	  				required_char =  options[:required_char] || '*'
	  				label_text = args[0].class == String ? args[0] : symbol.to_s[0..-7].titleize

	  				label(:post, symbol.to_s.gsub(/_label/, ''), label_text + prompt_char) + (is_required ? required_char : '')
        	}
        end

        send symbol
			end
		end
	end
end
