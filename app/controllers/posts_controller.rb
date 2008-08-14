class PostsController < ResourceController::Base
	alias r_c_generated_object object

  new_action.wants.html do
    for_admin_only do
      render :html => @posts
    end
  end
  
	index.wants.atom

  index.wants.html do
    @sticky = Post.sticky
		Twitter::Status.logger = logger
		begin
			if tweets_enabled
				@tweets = Twitter::Status.user_timeline
			end
		rescue
			@tweets = nil
			logger.error "Error receiving recent tweets: #{$!}"
		end
		
    for_users_by_type do |type|
      case type
        when :anonymous
          render :html => @posts
        when :admin
          if request.request_uri.downcase =~ /home/
            render :html => @posts
          else
            render :template => 'admin/posts/index', :html => @posts
          end
      end
    end
  end

	create.before { @post.author = @current_user }
	create.after { logger.info "MY OBJECT: #{@post} AND IT'S ATTRIBUTES: #{@post.attributes}" }

	show.wants.html do
		if params[:day] and params[:month] and params[:year]
			ex = "#{params[:month]}/#{params[:day]}/#{params[:year]}"
		elsif params[:year]
			ex = "Year: #{params[:year]}"
		end
	end

  show.wants.xml { render :xml => @post }
  new_action.wants.xml { render :xml => @post }
  index.wants.xml { render :xml => @posts }
  create.wants.xml { render :xml => @posts }
  update.wants.xml { render :xml => @post }
  destroy.wants.xml { head :ok }

  protected

  def object
		if params[:id]  	
			my_object = Post.find params[:id]
		elsif params[:action] != 'create'
			my_object = Post.new
		else
			my_object = r_c_generated_object
		end
		my_object
  end

  def load_collection
		if params[:tag]
			@posts = Post.find_tagged_with params[:tag]
		else
      @posts = Post.not_sticky.all  :limit => 10, :order => "created_at desc"
		end
  end

end
