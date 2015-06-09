class ActivitiesController < ApplicationController
  def show
    @activity = Activity.find(params[:id])
  end

  def destroy
    Activity.find(params[:id]).destroy
    flash[:success] = "Activity deleted"
    redirect_to activities_url
  end
  
  def new
    @activity = current_user.activities.build
  end

  def index
    @activities = current_user.activities.all
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

  def edit
    @activity = Activity.find(params[:id])
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

  private

  def activity_params
    params.require(:activity). permit(:activity_name, :importance, :user_id)
  end

end
