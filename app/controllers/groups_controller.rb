class GroupsController < ApplicationController

  before_action :set_group, only: [:edit, :update]

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def edit
  end


  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: "グループが作成されました"
    else
      flash.now[:alert] = "グループ作成に失敗しました"
      render action: :new
    end
  end

  def update
    if @group.update(group_params)
      redirect_to root_path, notice: "グループが編集されました"
    else
      flash.now[:alert] = "グループの編集に失敗しました"
      render action: :edit
    end
  end


  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
