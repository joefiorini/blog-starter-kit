class PostsController < ResourceController::Base
  
  show.wants.xml { render :xml => @post }
  new_action.wants.xml { render :xml => @post }
  index.wants.xml { render :xml => @posts }
  create.wants.xml { render :xml => @posts }
  update.wants.xml { render :xml => @post }
  destroy.wants.xml { head :ok }
  
  show.before do
    @extra_stylesheet = 'single.css'
  end
  
  index.before do
    @current_month = params[:month]
  end
  
  protected
  
  def load_collection
    if params[:month]
      @posts = Post.find_by_date(params[:month])
    else
      @posts = Post.find(:all, :order => 'created_at desc')
    end
  end

end
