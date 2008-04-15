class CommentsController < ResourceController::Base
  belongs_to :post

	create.wants.html { redirect_to @post }
	
end
