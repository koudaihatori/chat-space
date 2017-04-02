class CommentsController < ApplicationController
  def index
    @comment = Comment.new
  end
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
    else
      flash.now[:alert] = "グループ作成に失敗しました"
    end
    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
