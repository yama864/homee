class EventsController < ApplicationController
  before_action :move_to_top
  
  def index
    @group = Group.find(params[:group_id])
    @event = Event.all
    @events = @group.events.includes(:group).order(start: :DESC)
  end

  def new
    @event = Event.new
    @group = Group.find(params[:group_id])
    @events = @group.events.includes(:group).order(start: :DESC)
  end

  def create
    @group = Group.find(params[:group_id])
    @event = @group.events.new(params_event)
    if @event.save
      redirect_to group_events_path
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:group_id])
    @event = @group.events.find(params[:id])
  end

  def update
    @group = Group.find(params[:group_id])
    @event = @group.events.find(params[:id])
    if @event.update(params_event)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def destroy
    @group = Group.find(params[:group_id])
    @event = @group.events.find(params[:id])
    if @event.destroy
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  private

  def params_event
    params.require(:event).permit(:title, :start, :end, :group_id, :person)
  end

  def move_to_top
    unless user_signed_in?
      redirect_to  controller: :home, action: :top
    end
  end
end