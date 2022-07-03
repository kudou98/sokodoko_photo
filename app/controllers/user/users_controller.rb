class User::UsersController < ApplicationController
  before_action :set_user, only: [:favorites]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザ情報を更新しました"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  def favorites
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.where(id: favorites).page(params[:page])
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  

end
