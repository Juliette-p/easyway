# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# ################création users#################
puts "Clean database"
  User.destroy_all
  Activity.destroy_all
  Rating.destroy_all
  Favourite.destroy_all
puts "end destroy all"

puts "creating users"
camille = User.create!(first_name: "camille", last_name: "dupont", email: "camille.dupont@mail.com", password: "pass12C")
manu = User.create!(first_name: "manu", last_name: "martin", email: "camille.martin@mail.com", password: "pass12C")
puts "end creating users"
# ###############################################

# ################création activities#################
puts "creating activities"
musee_art_nantes = Activity.create!(name: "musée d'arts",
  description: ""
  category: "Lieux culturels",
  address: "10, rue Georges-Clemenceau, 44000 Nantes",
  phone_number: "02 51 17 45 00",
  url: "https://museedartsdenantes.nantesmetropole.fr/",
  stroller: true,
  changing_table: true,
  high_chair: false,
  kids_friendly: true,
  public_transport: true,
  public_transport_detail: "",
  car_park: true,
  car_park_detail: "",
  bike_park: true)

musee_hist_nat_nantes = Activity.create!(name: "musée d'histoire naturelle",
  category: "Lieux culturels",
  description:""
  address: "12 rue Voltaire, 44000 Nantes",
  phone_number: "02 40 41 55 00",
  url: "https://museum.nantesmetropole.fr/home.html",
  stroller: true,
  changing_table: true,
  high_chair: false,
  kids_friendly: true,
  public_transport: true,
  public_transport_detail: "Bus 23, C1, C3 (arrêt Copernic - Musées), Tram 1 (arrêt Médiathèque)",
  car_park: true,
  car_park_detail: "",
  bike_park: true)
puts "end creating activities"
# ###############################################

# ################création ratings#################
puts "creating ratings"
camille_rating_1 = Rating.create!(user: camille,
  activity: musee_art_nantes,
  visit_date: Date.today,
  rating: 4,
  comment: "très adapté aux enfants! super!",
  stroller: true,
  changing_table: true,
  high_chair: false,
  kids_friendly: true)
puts "end creating ratings"
# ###############################################

# ################création favourites#################
puts "creating favourites"
camille_fav = Favourite.create!(user: camille, activity: musee_art_nantes)
puts "end creating favourites"
# ###############################################
