class User::PostsController < ApplicationController
  before_action :authenticate_user! , only:[:new, :create, :edit, :update]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save ? (redirect_to user_post_path(@post)) : (render :new)
  end

  def index
    @post = Post.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def post_params
    params.require(:post).permit(:location,:post_image,:body)

  end

end
