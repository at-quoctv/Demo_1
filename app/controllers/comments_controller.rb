class CommentsController < ApplicationController
def index
    @comment = Comment.new
    @comments = Comment.all
end

def create
  
    @comment = current_user.comments.new comment_params
    if @comment.save
      flash[:success]='comment successfully!'
    end
    redirect_to micropost_path(id: @comment.micropost_id)
end

private
def comment_params
   params.require(:comment).permit(:content, :micropost_id,:user_id)

end
end
