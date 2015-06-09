class EventsController < ApplicationController

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      flash[:success]= "[SUCCESSFUL EVENT MESSAGE]"
      redirect_to @event
    else
      render 'new'
    end

  end

  def index
    @events = current_user.events.all
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "Event updated."
      redirect_to @event
    else
      render 'edit'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def destroy
    Event.find(params[:id]).destroy
    flash[:success] = "Event deleted"
    redirect_to events_url
  end

  private

  def event_params
    params.require(:event).permit(:event_name, :user_id, :start_time, :end_time)
  end

end
