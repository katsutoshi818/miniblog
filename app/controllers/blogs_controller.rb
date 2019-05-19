class BlogsController < ApplicationController
  def index
    @blogs = Blog.includes(:user).page(params[:page]).per(5).order("id DESC")
  end

  def show
    @blog = Blog.find(params[:id])
    @comment = Comment.new
    @comments = @blog.comments.includes(:user).page(params[:page]).per(5).order("id DESC")
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(blog_params)
    redirect_path
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params) if blog.user_id == current_user.id
    redirect_path
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy if blog.user_id == current_user.id
    redirect_path
  end

  private
  def blog_params
    params.require(:blog).permit(:text, :title).merge(user_id: current_user.id)
  end

  def redirect_path
    redirect_to root_path
  end
end
