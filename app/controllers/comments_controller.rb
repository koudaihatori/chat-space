class CommentsController < ApplicationController


  def index
    @group = Group.find(params[:group_id])
    @comment = Comment.new
    @comments = Comment.where(group_id: @group.id)
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to group_comments_path }
        format.json { render json:@comment}
      end
    else
      flash.now[:alert] = "メッセージ送信成功しました！"
      render :index
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(group_id: params[:group_id], user_id: current_user.id)
  end

end
