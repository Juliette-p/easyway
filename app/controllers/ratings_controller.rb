class RatingsController < ApplicationController
  def new
    @activity = Activity.find(params[:activity_id])
    @rating = Rating.new
  end

  def create


    @activity = Activity.find(params[:activity_id])
    @rating = Rating.new(rating_params)
    @rating.user = current_user
    @rating.activity_id = @activity.id

    if @rating.save!

      @activity.stroller = @rating.stroller
      @activity.changing_table = @rating.changing_table
      @activity.high_chair = @rating.high_chair
      @activity.kids_friendly = @rating.kids_friendly

      @activity.save
      redirect_to activity_path(@activity)
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def rating_params
    params.require(:rating).permit(:visit_date, :rating, :comment, :stroller, :changing_table, :high_chair, :kids_friendly)
  end

end
