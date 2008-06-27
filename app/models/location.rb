require 'google_geocode'
class Location < ActiveRecord::Base
		has_permalink :name
		
		def before_save
			gg = GoogleGeocode.new YAML.load_file(RAILS_ROOT + '/config/gmaps_api_key.yml')[ENV['RAILS_ENV']]
			loc = gg.locate self.full_address
			self.longitude = loc.longitude
			self.latitude = loc.latitude
		end
		
		def full_address(*args)
			opts = args[0]
			s = ""
			if opts[:new_line]
				s += "#{self.address}\n"
			else
				s += "#{self.address}"
			end
			"#{s} #{self.city}, #{self.state} #{self.zip_code}"
		end
end
