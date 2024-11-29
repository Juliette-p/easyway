class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # calcul des onglets favoris du current user
    @favourites = Favourite.where(user: current_user)
    @fav_activities = []
    @favourites.each do |favourite|
      @fav_activities << favourite.activity
    end

    # calcul des onglets les mieux notés
    # CALCUL A FAIRE PLUS TARD : trier par rating décroissant ou sélectionner les ratings qui > 4.0
    @activities = Activity.all

    # raise
  end
end
