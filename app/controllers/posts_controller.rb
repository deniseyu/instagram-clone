class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all.reverse
  end

  def new 
    @post = Post.new
  end

  def create
    @user = User.find(current_user)
    @post = @user.posts.new(post_params)
    if @post.save
      flash[:notice] = 'Post successfully created'
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(params[:post].permit(:caption, :image))
    flash[:notice] = 'Post successfully edited'
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post successfully deleted'
    redirect_to posts_path
  end

end
