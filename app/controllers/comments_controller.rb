class CommentsController < ApplicationController
  def new
    @comment = Post.find(params[:post_id]).comments.new(user_id: current_user.id)
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:user_id, :post_id, :body)
    end
end
