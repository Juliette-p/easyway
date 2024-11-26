class FavouritesController < ApplicationController
  def index
    @favorites = Favourite.where(user: current_user)
    @activities = []
    @favorites.each do |favorite|
      @activities << favorite.activity
    end
  end
end
