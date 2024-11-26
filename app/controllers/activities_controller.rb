class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
    @markers = @activities.geocoded.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude
      }
    end
  end

  def show
    @activity = Activity.find(params[:id])
  end
end
