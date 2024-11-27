class RatingsController < ApplicationController
  def new
    @activity = Activity.find(params[:activity_id])
    @rating = Rating.new
  end

  def create
    @activity = Activity.find(params[:activity_id])
    @rating = Rating.new(rating_params)

    # parametrer la date

    @rating.date = params[:rating][:date]



    @rating.rating = params[:rating][:rating].to_i
    @rating.stroller = params[:rating][:stroller] == "1"
    @rating.changing_table = params[:rating][:stroller] == "1"
    @rating.high_chair = params[:rating][:stroller] == "1"
    @rating.kids_friendly = params[:rating][:stroller] == "1"

    if @rating.save

      # @activity.stroller = params[:rating][:stroller] == "1"
      @activity.stroller = @rating.stroller
      @activity.changing_table = @rating.changing_table
      @activity.high_chair = @rating.high_chair
      @activity.kids_friendly = @rating.kids_friendly
      # @activity.changing_table = params[:changing_table] == "1"
      # @activity.high_chair = params[:high_chair] == "1"
      # @activity.kids_friendly = params[:kids_friendly] == "1"
      @activity.save
      raise
      redirect_to activity_path(@activity)
    else
      raise
      render :new, status: :unprocessable_entity
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:visit_date, :rating, :comment, :stroller, :changing_table, :high_chair, :kids_friendly)
  end
end
