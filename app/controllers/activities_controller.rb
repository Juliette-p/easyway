class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  def index
    # mise à jour de la liste d'activité
    @activities = Activity.all
    # raise
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

    respond_to do |format|
      # si format json alors on fait ça
      format.html {
        # mise à jour des marqueurs sur la map
        @markers = @activities.geocoded.map do |activity|
          {
            lat: activity.latitude,
            lng: activity.longitude,
            info_window_html: render_to_string(partial: "info_window", locals: { activity: activity }),
            marker_html: render_to_string(partial: "marker_map")
          }
        end
      }
      # si format json, pas d'action particulière
      format.json
    end
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.photo = params[:activity]["photo"]
    if @activity.save!
      redirect_to activity_path(@activity)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :address, :category, :description)
  end
end
