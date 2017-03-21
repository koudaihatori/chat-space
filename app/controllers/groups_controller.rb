class GroupsController < ApplicationController


  def new
    @group = Group.new
  end
  def edit
    @group = Group.find(params[:id])
  end


  def create
    @group = Group.create(name: group_params[:name])
  end
end
