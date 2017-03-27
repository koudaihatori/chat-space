class GroupsController < ApplicationController


  def new
    @group = Group.new
  end
  def edit
    @group = Group.find(params[:id])
  end


  def create
    Group.create(group_params)
  end

  private

  def group_params
    params.require(:group).permit(:name, {:author_ids => []})
  end
end
