class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post.likes.create
    render json: { new_likes_count: @post.likes.count }
  end

  def destroy
    @post = Post.find(params[:id])
    @post.likes.destroy
    render json: { new_likes_count: @post.likes.count }
  end

end