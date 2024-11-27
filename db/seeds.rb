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
manu = User.create!(first_name: "manu", last_name: "martin", email: "manu.martin@mail.com", password: "pass12M")
puts "end creating users"
# ###############################################

# ################création activities#################
puts "creating activities"
musee_art_nantes = Activity.create!(name: "musée d'arts",
  description: "Au Musée d’arts de Nantes, neuf siècles d’arts visuels, 
                du Moyen Âge à aujourd’hui, dialoguent au fil de ses espaces. Les collections représentent 
                un fonds de plus de 14 000 œuvres, dont près de la moitié en art moderne et contemporain. 
                Dans une architecture mariant celle d’hier à celle d’aujourd’hui, le musée offre aux visiteurs 
                un point de vue unique sur l’art occidental et d’audacieuses expositions temporaires qui font 
                la renommée de ce grand musée de l’Ouest. Dimanche: visite guidée en famille, venez avec vos enfants"
  category: "Lieux culturels",
  address: "10 rue Georges-Clemenceau, Nantes",
  phone_number: "02 51 17 45 00",
  url: "https://museedartsdenantes.nantesmetropole.fr/",
  stroller: true,
  changing_table: true,
  high_chair: false,
  kids_friendly: true,
  public_transport: true,
  public_transport_detail: "Tram :Ligne 1, arrêt « Duchesse-Anne » puis 6 minutes de marche
                            Ligne 2, arrêt « St-Mihiel » puis 10 minutes de marche
                            Bus: Lignes C1, C6, 11, 12 et Busway 4. Arrêt « Foch-Cathédrale » puis 4 minutes de marche.",
  car_park: true,
  car_park_detail: "Parking couvert : Cathédrale (rue Sully, 44000 Nantes)",
  bike_park: true,
  bike_park_detail: "Appuis-vélos à proximité (rue Delaunay et rue Clemenceau).
                    Le Musée d’arts de Nantes, labellisé “Accueil vélo”, met à disposition de ses visiteurs 
                    un kit de dépannage (pompe, chambre à air standard, clés universelles) disponible gratuitement 
                    sur demande à l’accueil du musée.")

musee_hist_nat_nantes = Activity.create!(name: "musée d'histoire naturelle",
  category: "Lieux culturels",
  description:""
  address: "12 rue Voltaire, Nantes",
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
