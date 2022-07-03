class User::FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :post_params, only: [:create, :destroy]
  
  def create
    Favorite.create(user_id: current_user.id, post_id: @post.id)
    #@post_favorite = Favorite.new(user_id: current_user.id, post_id: params[:post_id])
    #@post_favorite.save
    #redirect_to post_path(params[:post_id])
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, post_id: @post.id)
    favorite.destroy
    #@post_favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id])
    #@post_favorite.destroy
    #redirect_to post_path(params[:post_id])
  end
  
  
  private
  def post_params
    @post = Post.find(params[:post_id])
  end
  
end
