class GroupsController < ApplicationController
  
  def new
  end
  
  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to @group
    else
      render :new
    end
  end

  def signin
  end

  def signinmove
    @group = Group.new(group_params)
    if @group.save
      redirect_to @group
    else
      render :signin
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  private

  def group_params
    params.permit(:id, :group_name, :password).merge(user_id: current_user.id)
  end
end
