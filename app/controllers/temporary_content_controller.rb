class TemporaryContentController < ApplicationController
	def coming_soon
		render :text => 'Coming Soon!', :layout => true
	end
end
