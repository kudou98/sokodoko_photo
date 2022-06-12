class User::PostCommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post_comment = @post.post_comments.new(post_comment_params)
    @post_comment.user_id = current_user.id
    if @post_comment.save
      flash.now[:notice] = "コメントの投稿に成功しました"
      render :index
    else
      flash.now[:alert] = "コメントの投稿に失敗しました"
      render :index
    end
  end

  def destroy
    @post_comment = Post_comment.find(params[:id])
    @post_comment.destroy
    flash.now[:notice] = "コメントを削除しました。"
    render :index
  end


  private

  def post_comment_params
    params.require(:post_comment).permit(:post_comment, :user_id, :post_id)
  end

end
