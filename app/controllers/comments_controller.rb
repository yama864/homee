class CommentsController < ApplicationController
  before_action :move_to_top
  
  def index
    @group = Group.find(params[:group_id])
    @comment = Comment.new
    @comments = @group.comments.includes(:user).order(created_at: :desc)
  end

  def create
    @group = Group.find(params[:group_id])
    @comment = @group.comments.new(comment_params)
    if @comment.save
      redirect_to group_comments_path(@group.id)
    else
      @comments = @group.comments.includes(:user)
      render :index
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :image, :group_id).merge(user_id: current_user.id)
  end

  def move_to_top
    unless user_signed_in?
      redirect_to  controller: :home, action: :top
    end
  end
end
