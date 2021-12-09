class GroupsController < ApplicationController
  before_action :move_to_top

  def new
    @group = Group.new
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
    if @group && @group.authenticate(params[:password])
       if !@group.users.include?(current_user)
         @group.users << current_user
         redirect_to @group
       elsif @group.users.include?(current_user)
         redirect_to @group
       else
         flash.now[:alert] = 'グループ名またはパスワードを正しく入力してください'
         render :signin
       end
    else
      flash.now[:alert] = 'グループ名またはパスワードを正しく入力してください'
      render :signin
    end
  end

  def show
    @group = Group.find(params[:id])
    @users = @group.users
    @events = @group.events.where("start like ?","#{Date.today}%")
  end

  private

  def group_params_signin
    params.permit(:id, :group_name, :password_digest, { user_ids: [] })
  end

  def group_params
    params.require(:group).permit(:id, :group_name, :password, :password_confirmation, { user_ids: [] })
  end

  def move_to_top
    unless user_signed_in?
      redirect_to  controller: :home, action: :top
    end
  end
end
