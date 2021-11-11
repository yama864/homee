class CommentsController < ApplicationController
  def index
    @comment = Comment.new
    @group = Group.find(params[:group_id])
  end

  def create
  end
end
