# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  before_filter :retrieve_user

	def tweets_enabled
		false
	end

  protected
    def for_admin_only
      unless @current_user
        redirect_to(root_url) 
      else
        yield
      end
    end
    
    def for_users_by_type
      if @current_user
        yield :admin 
      else
        yield :anonymous
      end
    end

  private
    def retrieve_user
      @current_user = User.find(session[:user_id]) if session[:user_id]
    end
    
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '8881553f7ebc889994296b716578f818'
  
end
