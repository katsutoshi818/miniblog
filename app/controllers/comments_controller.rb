class CommentsController < ApplicationController
  
  def create
    @comment = Comment.create(comment_params)
    redirect_to blog_path(@comment.blog.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(blog_id: params[:blog_id], user_id: current_user.id)
  end
end
