require 'google_geocode'
class Location < ActiveRecord::Base
  has_many :events
	has_permalink :name
		
		def before_save
			gg = GoogleGeocode.new YAML.load_file(RAILS_ROOT + '/config/gmaps_api_key.yml')[ENV['RAILS_ENV']]
			loc = gg.locate self.full_address
			self.longitude = loc.longitude
			self.latitude = loc.latitude
		end
		
		def full_address(*args)
			"#{self.address} #{self.city}, #{self.state} #{self.zip_code}"
		end
end
