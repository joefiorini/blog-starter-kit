module Utils
	class TwitterAPI

		def self.url_with_credentials
			creds = File.open("#{RAILS_ROOT}/config/twitter_creds", 'r').read
			username,password = creds.split(':')[0],creds.split(':')[1]
			"http://#{username}:#{password}@twitter.com"
		end

		def self.filter_out_replies(tweets)
			tweets.reject { |k,v| (k == 'in_reply_to_status_id' and !v.nil?) }
		end

	end
end