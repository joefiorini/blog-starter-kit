module Twitter
	class Status < ActiveResource::Base
	
		self.site = Utils::TwitterAPI.url_with_credentials
		
		def self.user_timeline
			@@logger.info "Getting recent tweets from Twitter"
			tweets = find(:all, :from => "/statuses/user_timeline.xml")
			@@logger.info "Received recent tweets from Twitter"
			return Utils::TwitterAPI.filter_out_replies tweets
		end
		
		def self.logger=(val)
			@@logger = val
		end
		
	end
end