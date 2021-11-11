class GroupsController < ApplicationController
  
  def new
  end
  
  def create
    @group = Group.new(group_params)
    if @group.save
      @group.users << current_user
      redirect_to @group
    else
      render :new
    end
  end

  def signin
  end

  def signinmove
    @group = Group.find_by(group_params_signin)
    if !@group.users.include?(current_user)
      @group.users << current_user
      redirect_to @group
    elsif @group.users.include?(current_user)
      redirect_to @group
    else
      render :signin
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  private

  def group_params_signin
    params.permit(:id, :group_name, :password_digest, { user_ids: [] })
  end

  def group_params
    params.permit(:id, :group_name, :password, { user_ids: [] })
  end
end
