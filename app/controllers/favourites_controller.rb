class FavouritesController < ApplicationController
  def index
    @favourites = Favourite.where(user: current_user)
    @activities = []
    @favourites.each do |favourite|
      @activities << favourite.activity
    end
  end

  def create
    @activity = Activity.find(params[:activity_id])
    @favourite = Favourite.new(user: current_user, activity: @activity)
    if @favourite.save
      redirect_to activity_path(@activity)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @activity = Activity.find(params[:activity_id])
    @favourite = Favourite.where(user: current_user, activity: @activity).first
    @favourite.destroy
    redirect_to activities_path, status: :see_other
  end
end
