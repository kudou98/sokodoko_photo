class User::PostsController < ApplicationController
  before_action :authenticate_user! , only:[:new, :create, :edit, :update]

  def new
    @post = Post.new
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = '投稿しました!'
      redirect_to posts_path
    else
      render :new
    end
  end

  def index
    @posts = Post.page(params[:page])
    @tags = Tag.all

  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = @post.post_comments

    @post_tags = @post.tags
  end

  def edit
  end

  def update
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end


  def search_post
    @post =Post.new
    @posts = Post.search(params[:keyword])
    if (params[:keyword])[0] == '#'
      @posts = Tag.search(params[:keyword]).order('created_at DESC')
    else
      @posts = Post.search(params[:keyword]).order('created_at DESC')
    end
  end


  private

  def post_params
    params.require(:post).permit(:location,:post_image,:body,:tag)
  end


end
