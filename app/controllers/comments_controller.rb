class CommentsController < ResourceController::Base
  belongs_to :post
	has_rakismet
	
	create.wants.html { redirect_to @post }
	create.failure.wants.html { redirect_to @post }
end
