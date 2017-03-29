class GroupsController < ApplicationController


  def new
    @group = Group.new
  end
  def edit
    @group = Group.find(params[:id])
  end


  def create
    Group.create(group_params)
    redirect_to controller: :chat_groups, action: :index
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [] << current_user.id)
  end
end
