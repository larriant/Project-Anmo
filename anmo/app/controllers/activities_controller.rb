class ActivitiesController < ApplicationController

  before_action :logged_in_user

  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @activity = current_user.activities.build
  end

  def create
    @activity= current_user.activities.build(activity_params)

    if @activity.save
      flash[:success] = "[SUCCESSFUL ACTIVTY MESSAGE]"
      redirect_to @activity
    else
      render 'new'
    end
  end

  def index
    @activities = current_user.activities.all
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update_attributes(activity_params)
      flash[:success] = "Activity updated."
      redirect_to @activity
    else
      render 'edit'
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def destroy
    Activity.find(params[:id]).destroy
    flash[:success] = "Activity deleted"
    redirect_to activities_url
  end
  
  private

  def activity_params
    params.require(:activity). permit(:activity_name, :importance, :frequency, :activity_type, :start_time, :end_time, :completion_date, :user_id)
  end

#  def logged_in_user
#    unless logged_in?
#      flash[:danger] = "You must be a user to edit activities."
#      redirect_to root_url
#    end
#  end

end
