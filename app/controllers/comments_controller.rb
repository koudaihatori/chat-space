class CommentsController < ApplicationController


  def index
    @group = Group.find(params[:group_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to group_comments_path
    else
      flash.now[:alert] = "メッセージ送信成功しました！"
      redirect_to group_comments_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(group_id: params[:group_id], user_id: current_user.id)
  end

end
