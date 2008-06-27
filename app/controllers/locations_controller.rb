class LocationsController < ResourceController::Base

	new_action.wants.html do
		for_admin_only do
			render :html => @location
		end
	end

	show.wants.html do
		@map = GMap.new("map_div")
		@map.control_init(:large_map => true)
		@map.center_zoom_init([@location.latitude, @location.longitude],13)
		@map.overlay_init(GMarker.new([@location.latitude, @location.longitude],:title => @location.name, :info_window => @location.name))
		@gmaps_needed = true
	end
	
	def object
		@location ||= Location.find_by_permalink params[:id]
	end
end
