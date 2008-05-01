class PostsController < ResourceController::Base

  new_action.wants.html do
    for_admin_only do
      render :html => @posts
    end
  end
  
	index.wants.atom

  index.wants.html do
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

  show.wants.xml { render :xml => @post }
  new_action.wants.xml { render :xml => @post }
  index.wants.xml { render :xml => @posts }
  create.wants.xml { render :xml => @posts }
  update.wants.xml { render :xml => @post }
  destroy.wants.xml { head :ok }
  
  protected
  
  def load_collection
		if params[:tag]
			@posts = Post.find_tagged_with params[:tag] 
		else
      @posts = Post.find(:all, :limit => 10, :order => "created_at desc")
		end
  end

end
