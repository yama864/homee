class CommentsController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @comment = Comment.new
    @comments = @group.comments.includes(:user)
  end

  def create
    @group = Group.find(params[:group_id])
    @comment = @group.comments.new(comment_params)
    if @comment.save
      redirect_to group_comments_path(@group.id)
    else
      render :index
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :image, :group_id).merge(user_id: current_user.id)
  end
end
