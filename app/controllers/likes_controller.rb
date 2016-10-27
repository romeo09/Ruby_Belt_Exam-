class LikesController < ApplicationController
  def create
     post = Post.find(params[:id])
     like = Like.create(user: current_user, post: post)
     redirect_to ("/posts/index/#{current_user.id}")
  end

  def destroy
     like = Like.where(post_id: params[:id], user_id: session[:user_id]).first.destroy
     redirect_to :back
  end
end
