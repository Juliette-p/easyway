class FavouritesController < ApplicationController
  def index
    # Mise à jour de la liste des favoris
    @favourites = Favourite.where(user: current_user)

    # Mise à jour de la liste des activités favorites
    @activities = []
    @favourites.each do |favourite|
      @activities << favourite.activity
    end

    @activities = @activities.search_by_address_name(params[:search]) if params[:search].present?
    if params[:stroller].present?
      @activities = @activities.where(stroller: true) if params[:stroller] == "1"
    end
    if params[:changing_table].present?
      @activities = @activities.where(changing_table: true) if params[:changing_table] == "1"
    end
    if params[:high_chair].present?
      @activities = @activities.where(high_chair: true) if params[:high_chair] == "1"
    end
    if params[:kids_friendly].present?
      @activities = @activities.where(kids_friendly: true) if params[:kids_friendly] == "1"
    end
    if params[:category].present?
      @activities = @activities.where(category: params[:category])
    end
  end

  def create
    @activity = Activity.find(params[:activity_id])
    @favourite = Favourite.new(user: current_user, activity: @activity)
    if @favourite.save
      redirect_to activity_path(@favourite.activity)
    else
      render "activity/show"
    end

  end

  def destroy
    @activity = Activity.find(params[:activity_id])
    @favourite = Favourite.where(user: current_user, activity: @activity).first
    if @favourite.destroy
      redirect_to activity_path(@favourite.activity)
    else
      render "activity/show"
    end
  end
end
