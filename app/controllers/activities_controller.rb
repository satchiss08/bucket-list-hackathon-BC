class ActivitiesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def create
    @activity = Activity.new(params.require(:activity).permit(:name,:place))
    @activity.save
    render 'show', status: 201
  end

  def update
    activity = Activity.find(params[:id])
    activity.update_attributes(params.require(:activity).permit(:name,:place))
    head :no_content
  end

  def destroy
    activity = Activity.find(params[:id])
    activity.destroy
    head :no_content
  end
end
