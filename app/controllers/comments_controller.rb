class CommentsController < ApplicationController
  rescue_from ActionController::RedirectBackError, with: :redirect_to_default

  def index
    @group = Group.find(params[:group_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to :back
    else
      flash.now[:alert] = "メッセージ送信成功しました！"
      redirect_to :back
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(group_id: params[:group_id], user_id: current_user.id)
  end
  def redirect_to_default
    redirect_to group_comments_path
  end
end
