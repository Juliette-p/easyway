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
puts "creating culturals activities"

file = URI.parse( "https://www.seevisit.fr/uploads/seevisit-nantes-musee-d-art-de-nantes.jpg" ).open
musee_art_nantes = Activity.new(name: "musée d'arts",
  description: "Au Musée d’arts de Nantes, neuf siècles d’arts visuels, du Moyen Âge à aujourd’hui, 
                dialoguent au fil de ses espaces. Les collections représentent un fonds de plus de 14000 œuvres, 
                dont près de la moitié en art moderne et contemporain. Dans une architecture mariant celle d’hier à 
                celle d’aujourd’hui, le musée offre aux visiteurs un point de vue unique sur l’art occidental et 
                d’audacieuses expositions temporaires qui font la renommée de ce grand musée de l’Ouest.
                Dimanche: visite en famille, venez avec vos enfants.
                Parce que l’art n’est pas qu’une affaire de grands, les tout-petits sont les bienvenus ! 
                L’accès poussette se fait par l’ascenseur sur le parvis du musée et des tables à langer sont installées 
                aux sanitaires de l’étage -1.
                Restaurer les œuvres oui, les petits ventres aussi ! Avant ou après la visite, le Café du musée vous 
                attend pour prendre le goûter. Des livres pour petits et grands ainsi que des jeux de société sont 
                à disposition.
                Passez aussi faire un tour à la librairie-boutique, qui propose un large choix de souvenirs : crayons, 
                jeux, livres, cartes-postales, carnets de dessins…",
  category: "Lieux culturels",
  address: "10 rue Georges-Clemenceau, Nantes",
  phone_number: "02 51 17 45 00",
  url: "https://museedartsdenantes.nantesmetropole.fr/",
  stroller: true,
  changing_table: true,
  high_chair: false,
  kids_friendly: true,
  public_transport: true,
  public_transport_detail: "Tram: Ligne 1, arrêt « Duchesse-Anne » puis 6 minutes de marche
                            Ligne 2, arrêt « St-Mihiel » puis 10 minutes de marche
                            Bus: Lignes C1, C6, 11, 12 et Busway 4.Arrêt « Foch-Cathédrale » 
                            puis 4 minutes de marche.",
  car_park: true,
  car_park_detail: "Parking couvert : Cathédrale (rue Sully, 44000 Nantes)",
  bike_park: true,
  bike_park_detail: "Appuis-vélos à proximité: rue Delaunay et rue Clemenceau.")
  musee_art_nantes.photo.attach(io: file, filename: "museeartnantes.jpg", content_type: "image/jpg")
  musee_art_nantes.save

  
file = URI.parse("https://www.chateaunantes.fr/wp-content/uploads/2020/09/Chateau-des-ducs-de-Bretagne.-Nantes-%C2%A9-Philippe-Piron-_-LVAN-2-768x614.jpg").open
chateau_des_ducs = Activity.new(name: "Château des Ducs de Bretagne",
  description: "Le Château des Ducs de Bretagne, forteresse médiévale au cœur de Nantes, abrite le musée d'histoire de 
  la ville. Avec ses remparts, sa cour intérieure et ses expositions interactives, il offre un voyage 
  fascinant à travers l'histoire de Nantes et de la région. Les enfants apprécieront particulièrement 
  les animations et les ateliers proposés pendant les vacances scolaires.",
  category: "Lieux culturels",
  address: "4 Place Marc Elder, 44000 Nantes",
  phone_number: "08 11 46 46 44",
  url: "https://www.chateaunantes.fr/",
  stroller: true,
  changing_table: true,
  high_chair: false,
  kids_friendly: true,
  public_transport: true,
  public_transport_detail: "Tram: Ligne 1, arrêt 'Duchesse Anne - Château'",
  car_park: true,
  car_park_detail: "Parking Château (payant)",
  bike_park: true,
  bike_park_detail: "Stations Bicloo à proximité")
chateau_des_ducs.photo.attach(io: file, filename: "chateaudesducs.jpg", content_type: "image/jpg")
chateau_des_ducs.save
  
file = URI.parse("https://mavieenloireatlantique.fr/wp-content/uploads/2023/02/machines-de-lile-11.jpg").open
machines_ile = Activity.new(name: "Les Machines de l'île",
  description: "Les Machines de l'île sont un projet artistique unique, mêlant l'imaginaire de Jules Verne aux mondes 
  mécaniques de Léonard de Vinci. Le Grand Éléphant, le Carrousel des Mondes Marins et l'Arbre aux Hérons 
  émerveillent petits et grands. Des ateliers de découverte sont proposés pour les enfants.",
  category: "Lieux culturels",
  address: "Boulevard Léon Bureau, 44200 Nantes",
  phone_number: "0810 12 12 25",
  url: "https://www.lesmachines-nantes.fr/",
  stroller: true,
  changing_table: true,
  high_chair: true,
  kids_friendly: true,
  public_transport: true,
  public_transport_detail: "Tram: Ligne 1, arrêt 'Chantiers Navals'",
  car_park: true,
  car_park_detail: "Parking des Machines (payant)",
  bike_park: true,
  bike_park_detail: "Parking vélos gratuit sur site")
machines_ile.photo.attach(io: file, filename: "machinesile.jpg", content_type: "image/jpg")
machines_ile.save
  

file = URI.parse("https://metropole.nantes.fr/files/images/culture-patrimoine/equipements/ecran-planetarium-675.jpg").open
planetarium = Activity.new(name: "Planétarium de Nantes",
description: "Le Planétarium de Nantes offre un voyage fascinant à travers l'univers. Grâce à son dôme-écran de 8 
mètres de diamètre, les visiteurs peuvent explorer les étoiles, les planètes et les galaxies. 
Des séances spéciales pour enfants sont proposées, ainsi que des ateliers d'astronomie pendant les 
vacances scolaires.",
category: "Lieux culturels",
address: "8 Rue des Acadiens, 44100 Nantes",
phone_number: "02 40 73 99 23",
url: "https://planetarium.nantes.fr/",
stroller: true,
changing_table: true,
high_chair: false,
kids_friendly: true,
public_transport: true,
public_transport_detail: "Bus: Ligne 26, arrêt 'Chêne des Anglais'",
car_park: true,
car_park_detail: "Parking gratuit sur place",
bike_park: true,
bike_park_detail: "Parking vélos devant l'entrée")
planetarium.photo.attach(io: file, filename: "planetarium.jpg", content_type: "image/jpg")
planetarium.save

file = URI.parse("https://api-infonantes.nantesmetropole.fr/banque/public/images/lieux/m/e128-3-museumpoursiteville.jpg").open
museum_histoire_naturelle = Activity.new(name: "Muséum d'Histoire Naturelle",
description: "Le Muséum d'Histoire Naturelle de Nantes propose une fascinante exploration de la biodiversité et de 
              l'évolution. Avec ses collections de fossiles, de minéraux et d'animaux naturalisés, il offre une 
              expérience éducative pour toute la famille. Des ateliers et des visites guidées sont régulièrement 
              organisés pour les enfants.",
category: "Lieux culturels",
address: "12 Rue Voltaire, 44000 Nantes",
phone_number: "02 40 41 55 00",
url: "https://museum.nantesmetropole.fr/",
stroller: true,
changing_table: true,
high_chair: false,
kids_friendly: true,
public_transport: true,
public_transport_detail: "Tram: Ligne 1, arrêt 'Médiathèque'. Bus 23, C1, C3 (arrêt Copernic - Musées)",
car_park: true,
car_park_detail: "Parking Médiathèque (payant)",
bike_park: true,
bike_park_detail: "Arceaux à vélos devant le musée")
museum_histoire_naturelle.photo.attach(io: file, filename: "museumhistoirenaturelle.jpg", content_type: "image/jpg")
museum_histoire_naturelle.save

file = URI.parse("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtvIQa3L_HfqHryQGuKqi5E42zU9l1Zo3f2Q&s").open
musee_enfants = Activity.new(name: "Musée des enfants de Nantes",
description: "Le Musée des Enfants de Nantes est un lieu unique conçu pour éveiller, stimuler et développer 
              l'imagination des enfants. Il offre des expositions interactives, des ateliers créatifs et des espaces 
              d'expérimentation adaptés aux enfants de 3 mois à 12 ans. Le musée vise à démocratiser l'art et la 
              culture auprès de tous les enfants, tout en renforçant les liens intergénérationnels et familiaux12.",
category: "Lieux culturels",
address: "20 All. de la Maison Rouge, 44000 Nantes",
phone_number: "06 50 49 68 81",
url: "https://www.le-musee-des-enfants-de-nantes.fr",
stroller: true,
changing_table: true,
high_chair: true,
kids_friendly: true,
public_transport: true,
public_transport_detail: "Tramway: Ligne 2, arrêt 'Saint-Mihiel'",
car_park: true,
car_park_detail: "Parking à proximité",
bike_park: true,
bike_park_detail: "Arceaux à vélos disponibles")
musee_enfants.photo.attach(io: file, filename: "musee_enfants.jpg", content_type: "image/jpg")
musee_enfants.save!

# ###############################################
puts "creating activity parc et jardins"

# jardin des plantes
file = URI.parse("https://www.jardinspaysdelaloire.fr/media/4399/big/44-jardindesplantes_depliant2011_%C2%A9com-externe-ville-de-nantes.jpg").open
jardin_plantes = Activity.new(name: "Jardin des Plantes",
  description: "Le Jardin des Plantes de Nantes est un havre de paix au cœur de la ville. Avec ses 7 hectares, ses serres et ses collections botaniques, c'est un lieu idéal pour une promenade en famille. Les enfants adoreront le manège écologique et les aires de jeux. Des visites guidées et des ateliers sont régulièrement organisés.",
  category: "Parcs",
  address: "Rue Stanislas Baudry, 44000 Nantes",
  phone_number: "02 40 41 65 09",
  url: "https://jardins.nantes.fr/N/Jardin/Parcs-Jardins/Plus/546/Jardin-des-Plantes",
  stroller: true,
  changing_table: false,
  high_chair: false,
  kids_friendly: true,
  public_transport: true,
  public_transport_detail: "Tram: Ligne 1, arrêt 'Gare SNCF Nord'",
  car_park: false,
  car_park_detail: "",
  bike_park: true,
  bike_park_detail: "Arceaux à vélos à l'entrée du jardin")
jardin_plantes.photo.attach(io: file, filename: "jardinplantes.jpg", content_type: "image/jpg")
jardin_plantes.save

#  Parc du Grand Blottereau
file = URI.parse("https://fastly.4sqi.net/img/general/600x600/7gctTY8eF2YH9-yLPLgHFck5eKOKJr7bvxjncTBYwJ4.jpg").open
grand_blottereau = Activity.new(name: "Parc du Grand Blottereau",
  description: "Le Parc du Grand Blottereau est un vaste espace vert de 37 hectares offrant une variété d'activités pour toute la famille. Les enfants peuvent profiter des aires de jeux, explorer le potager pédagogique, et observer les animaux de la mini-ferme. Le parc propose également des serres tropicales et des jardins thématiques.",
  category: "Parcs",
  address: "Boulevard Auguste Péneau, 44300 Nantes",
  phone_number: "02 40 41 90 00",
  url: "https://jardins.nantes.fr/N/Jardin/Parcs-Jardins/Plus/544/Parc-du-Grand-Blottereau",
  stroller: true,
  changing_table: false,
  high_chair: false,
  kids_friendly: true,
  public_transport: true,
  public_transport_detail: "Tram: Ligne 1, arrêt 'Mairie de Doulon'",
  car_park: true,
  car_park_detail: "Parking gratuit à l'entrée du parc",
  bike_park: true,
  bike_park_detail: "Arceaux à vélos disponibles")
grand_blottereau.photo.attach(io: file, filename: "grandblottereau.jpg", content_type: "image/jpg")
grand_blottereau.save

# Parc de la Beaujoire
file = URI.parse("https://nanteswithlove.fr/wp-content/uploads/2015/07/Parc-de-la-Roseraie-Nantes-61.jpg").open
parc_beaujoire = Activity.new(name: "Parc de la Beaujoire",
  description: "Le Parc de la Beaujoire est un vaste espace vert de 12 hectares, idéal pour les activités en famille. 
                Les enfants adoreront les aires de jeux, le parcours sportif, et les grands espaces pour courir et 
                jouer. Le parc abrite également un jardin des plantes médicinales et aromatiques, parfait pour éveiller 
                les sens des plus jeunes.",
  category: "Parcs",
  address: "Route de Saint-Joseph, 44300 Nantes",
  phone_number: "02 40 41 9000",
  url: "https://jardins.nantes.fr/N/Jardin/Parcs-Jardins/Plus/542/Parc-de-la-Beaujoire",
  stroller: true,
  changing_table: false,
  high_chair: false,
  kids_friendly: true,
  public_transport: true,
  public_transport_detail: "Tram: Ligne 1, arrêt 'Beaujoire'",
  car_park: true,
  car_park_detail: "Parking gratuit à l'entrée du parc",
  bike_park: true,
  bike_park_detail: "Arceaux à vélos disponibles")
parc_beaujoire.photo.attach(io: file, filename: "parcbeaujoire.jpg", content_type: "image/jpg")
parc_beaujoire.save

# Jardin extraordinaire
file = URI.parse("https://api-infonantes.nantesmetropole.fr/banque/public/images/lieux/2/1-E5665-24062023-BLL2274.jpg").open
jardin_extraordinaire = Activity.new(name: "Jardin extraordinaire",
description: "Le Jardin extraordinaire est un parc public de 3,5 hectares situé dans l'ancienne carrière Miséry à Nantes. Inauguré en 2019, il offre une expérience unique avec sa cascade de 25 mètres, sa flore exotique et son ambiance inspirée de l'univers de Jules Verne. Les visiteurs peuvent admirer plus de 200 espèces végétales, dont des bananiers, lotus et fougères arborescentes. Un grand escalier de 177 marches offre des vues panoramiques sur la Loire123.",
category: "Parcs",
address: "1 Rue Joseph Cholet, 44100 Nantes",
phone_number: "02 40 41 90 00",
url: "https://nature.metropole.nantes.fr/parcs-jardins/le-jardin-extraordinaire/",
stroller: true,
changing_table: false,
high_chair: false,
kids_friendly: true,
public_transport: true,
public_transport_detail: "Tramway: Ligne 1, arrêt 'Gare Maritime' (à 15 min à pied) ou Bus: Ligne 81, arrêt 'Carrière Miséry'24",
car_park: true,
car_park_detail: "Parking à proximité",
bike_park: true,
bike_park_detail: "Arceaux à vélos disponibles")
jardin_extraordinaire.photo.attach(io: file, filename: "jardinextraordinaire.jpg", content_type: "image/jpg")
jardin_extraordinaire.save

file = URI.parse("https://www.levoyageanantes.fr/wp-content/uploads/2015/10/maison-erdre-nantes.jpg").open
ile_versailles = Activity.new(name: "Jardin de l'Ile de Versailles",
description: "Le Jardin de l'Ile de Versailles est un parc de 1,5 hectares situé sur l'Erdre à Nantes. Il offre un dépaysement unique avec son jardin japonais, ses cascades et sa végétation exotique. Les enfants apprécieront la diversité des plantes, les jeux d'eau, le bassin avec canards et carpes koï, ainsi que l'aire de jeux. La Maison de l'Erdre propose des expositions sur la biodiversité et l'histoire de la rivière.",
category: "Parcs",
address: "Quai de Versailles, 44000 Nantes",
phone_number: "02 40 41 90 00",
url: "https://nature.metropole.nantes.fr/parcs-jardins/ile-de-versailles/",
stroller: true,
changing_table: false,
high_chair: false,
kids_friendly: true,
public_transport: true,
public_transport_detail: "Tramway: Ligne 2, arrêt 'Saint-Mihiel'",
car_park: true,
car_park_detail: "Parking à proximité",
bike_park: true,
bike_park_detail: "Arceaux à vélos disponibles")
ile_versailles.photo.attach(io: file, filename: "ileversailles.jpg", content_type: "image/jpg")
ile_versailles.save

file = URI.parse("https://upload.wikimedia.org/wikipedia/commons/0/02/Nantes_-_Parc_Gaudiniere_%281%29.jpg").open
parc_gaudiniere = Activity.new(name: "Parc de la Gaudinière",
  description: "Le Parc de la Gaudinière est un vaste jardin paysager de 12,5 hectares situé au nord de Nantes. Il offre une variété d'espaces, dont des bois de feuillus, des pelouses ensoleillées, et une rocaille alpine. Les enfants apprécieront les aires de jeux, les grands espaces pour courir, et l'observation de la faune locale comme les écureuils, les oiseaux et les canards. Le parc est particulièrement beau au printemps avec sa floraison de narcisses, crocus et anémones.",
  category: "Parcs",
  address: "227 Boulevard Robert Schuman, 44300 Nantes",
  phone_number: "02 40 41 90 00",
  url: "https://jardins.nantes.fr/N/Jardin/Parcs-Jardins/Plus/542/Parc-de-la-Gaudiniere",
  stroller: true,
  changing_table: false,
  high_chair: false,
  kids_friendly: true,
  public_transport: true,
  public_transport_detail: "Bus: C2, C20 (arrêts : Pont du Cens, Patouillerie et Cimetière de la Gaudinière)",
  car_park: true,
  car_park_detail: "Parking gratuit à proximité",
  bike_park: true,
  bike_park_detail: "Arceaux à vélos disponibles")
parc_gaudiniere.photo.attach(io: file, filename: "parcgaudiniere.jpg", content_type: "image/jpg")
parc_gaudiniere.save!

file = URI.parse("https://www.nantesweb.net/wp-content/uploads/2019/02/DSC_6241.jpg").open
parc_proce = Activity.new(name: "Parc de Procé",
  description: "Le Parc de Procé est un grand parc paysager de style anglais au cœur de Nantes. Il offre de vastes pelouses, des arbres centenaires, un étang et des allées ombragées, idéales pour les promenades en famille. Les enfants peuvent profiter des aires de jeux, observer les canards sur l'étang, et participer aux animations nature organisées régulièrement.",
  category: "Parcs",
  address: "Boulevard des Anglais, 44000 Nantes",
  phone_number: "02 40 41 90 00",
  url: "https://jardins.nantes.fr/N/Jardin/Parcs-Jardins/Plus/542/Parc-de-Proce",
  stroller: true,
  changing_table: false,
  high_chair: false,
  kids_friendly: true,
  public_transport: true,
  public_transport_detail: "Bus: Ligne 10, arrêt 'Procé'",
  car_park: true,
  car_park_detail: "Parking gratuit à proximité",
  bike_park: true,
  bike_park_detail: "Arceaux à vélos disponibles")
parc_proce.photo.attach(io: file, filename: "parcproce.jpg", content_type: "image/jpg")
parc_proce.save!

file = URI.parse("https://nature.metropole.nantes.fr/wp-content/uploads/2023/08/08/04062023-bll5470.jpg").open
jardin_enfants_proce = Activity.new(name: "Jardin d'enfants de Procé",
  description: "Le Jardin d'enfants de Procé est un espace dédié aux plus jeunes au sein du Parc de Procé. Il propose diverses structures de jeux adaptées à différents âges, comme des toboggans, des balançoires, et des jeux à ressort. C'est un lieu sécurisé où les enfants peuvent s'amuser et développer leur motricité tout en profitant du cadre verdoyant du parc.",
  category: "Parcs",
  address: "Rue des Dervallières, 44100 Nantes",
  phone_number: "02 40 41 90 00",
  url: "https://jardins.nantes.fr/N/Jardin/Parcs-Jardins/Plus/542/Parc-de-Proce",
  stroller: true,
  changing_table: false,
  high_chair: false,
  kids_friendly: true,
  public_transport: true,
  public_transport_detail: "Bus: Ligne 10, arrêt 'Procé'",
  car_park: true,
  car_park_detail: "Parking gratuit à proximité",
  bike_park: true,
  bike_park_detail: "Arceaux à vélos disponibles")
jardin_enfants_proce.photo.attach(io: file, filename: "jardinenfantsproce.jpg", content_type: "image/jpg")
jardin_enfants_proce.save!

# ###############################################
puts "creating restaurants et cafés"

file = URI.parse("https://www.lestablesdenantes.fr/wp-content/uploads/2024/08/IMG_1004-scaled.jpg").open
les_gamines = Activity.new(
name: "Les Gamines",
description: "Les Gamines est un café-restaurant family friendly à Nantes. Il offre un espace de jeux pour les enfants, 
              une cuisine maison avec des options végétariennes, et organise régulièrement des ateliers et événements 
              pour toute la famille. L'endroit est conçu pour que les parents puissent se détendre tout en gardant 
              un œil sur leurs enfants.",
category: "Cafés et restaurants",
address: "5 rue Lamoricière, 44100 Nantes",
phone_number: "09 83 93 98 90",
url: "https://lesgamines-cafe.com",
stroller: true,
changing_table: true,
high_chair: true,
kids_friendly: true,
public_transport: true,
public_transport_detail: "Tramway: Ligne 1, arrêt 'Chantiers Navals'",
car_park: true,
car_park_detail: "Parking à proximité",
bike_park: true,
bike_park_detail: "Arceaux à vélos disponibles")
les_gamines.photo.attach(io: file, filename: "les_gamines.jpg", content_type: "image/jpg")
les_gamines.save!

cafe_marmaille = Activity.new(
name: "Le café Marmaille",
description: "Le café Marmaille est un lieu convivial à Nantes, adapté aux familles. Il propose 
              une restauration légère et des boissons dans un cadre accueillant pour les enfants.",
category: "Cafés et restaurants",
address: "8 Rue Jeanne d'Arc, 44000 Nantes",
phone_number: "02 40 89 70 86",
url: "https://www.facebook.com/cafemarmaille/?locale=fr_FR",
stroller: true,
changing_table: true,
high_chair: true,
kids_friendly: true,
public_transport: true,
public_transport_detail: "Informations non disponibles",
car_park: true,
car_park_detail: "Parking à proximité",
bike_park: true,
bike_park_detail: "Arceaux à vélos probablement disponibles")

# La Cantine du Voyage
file = URI.parse("https://www.antoninfaurel.com/wp-content/uploads/2018/08/cantine_du_voyage_faurel_lejeunedurhin_2.jpg").open
cantine_voyage = Activity.new(name: "La Cantine du Voyage",
  description: "La Cantine du Voyage est un restaurant éphémère qui s'installe chaque été sur l'île de Nantes. 
                Dans une ambiance conviviale et décontractée, elle propose une cuisine locale et de saison. 
                Les enfants apprécieront l'espace extérieur avec des jeux et la possibilité de pique-niquer sur l'herbe. C'est un lieu idéal pour un déjeuner en famille lors d'une journée de découverte de l'île.",
  category: "Cafés et restaurants",
  address: "Quai des Antilles, 44200 Nantes",
  phone_number: "02 51 82 37 70",
  url: "https://www.levoyageanantes.fr/etapes/la-cantine-du-voyage/",
  stroller: true,
  changing_table: true,
  high_chair: true,
  kids_friendly: true,
  public_transport: true,
  public_transport_detail: "Tram: Ligne 1, arrêt 'Chantiers Navals'",
  car_park: true,
  car_park_detail: "Parking Hangar à Bananes à proximité",
  bike_park: true,
  bike_park_detail: "Arceaux à vélos disponibles")
cantine_voyage.photo.attach(io: file, filename: "cantinevoyage.jpg", content_type: "image/jpg")
cantine_voyage.save

# Le Petit Bacchus
file = URI.parse("https://scontent-cdg4-2.xx.fbcdn.net/v/t39.30808-6/464444292_8620405064741067_5288523795565714004_n.png?_nc_cat=109&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=dHoKSFvNQ-YQ7kNvgFiUbL9&_nc_zt=23&_nc_ht=scontent-cdg4-2.xx&_nc_gid=Ac3qsA6rVCmdZFxGzNlx3RV&oh=00_AYC8CMR37HZJteI21Jj6xVQsnm5GJKvkssjQ44paGKOEvw&oe=674D01C6").open
petit_bacchus = Activity.new(name: "Le Petit Bacchus",
  description: "Le Petit Bacchus est un restaurant familial au cœur de Nantes, réputé pour sa cuisine traditionnelle 
                française. L'ambiance chaleureuse et le menu enfant varié en font un lieu idéal pour un repas en famille. 
                Les enfants apprécieront les portions généreuses et l'accueil bienveillant du personnel.",
  category: "Cafés et restaurants",
  address: "5 Rue Beauregard, 44000 Nantes",
  phone_number: "02 40 20 24 25",
  url: "https://www.facebook.com/lepetitbacchusnantes/",
  stroller: true,
  changing_table: false,
  high_chair: true,
  kids_friendly: true,
  public_transport: true,
  public_transport_detail: "Tram: Ligne 1, arrêt 'Commerce'",
  car_park: false,
  car_park_detail: "",
  bike_park: true,
  bike_park_detail: "Arceaux à vélos dans la rue")
petit_bacchus.photo.attach(io: file, filename: "petitbacchus.jpg", content_type: "image/jpg")
petit_bacchus.save

# Restaurant 1: Le café des Enfants
file = URI.parse("https://resize.elle.fr/original/var/plain_site/storage/images/loisirs/sorties/dossiers/cafe-pour-enfants-cafe-poussette/80850947-1-fre-FR/Cafes-pour-enfants-nos-adresses-preferees.jpg").open
cantine_enfants = Activity.new(name: "Le Café des Enfants",
  description: "Un restaurant familial avec un menu spécial pour les enfants et une aire de jeux intérieure. Les plats sont préparés avec des ingrédients locaux et biologiques.",
  category: "Cafés et restaurants",
  address: "2 rue Joyau, 44000 Nantes",
  phone_number: "02 40 12 34 56",
  url: "https://lecafedesenfants.fr",
  stroller: true,
  changing_table: true,
  high_chair: true,
  kids_friendly: true,
  public_transport: true,
  public_transport_detail: "Bus: Ligne 23, arrêt 'Petits Gourmands'",
  car_park: true,
  car_park_detail: "Parking gratuit à 100m",
  bike_park: true,
  bike_park_detail: "Arceaux à vélos devant le restaurant")
cantine_enfants.photo.attach(io: file, filename: "cantineenfants.jpg", content_type: "image/jpg")
cantine_enfants.save

# Restaurant 2: La poule mouillette
file = URI.parse("https://resize-elle.ladmedia.fr/rcrop/638,,forcex/img/var/plain_site/storage/images/loisirs/sorties/dossiers/cafe-pour-enfants-cafe-poussette/poule-mouillette/80851625-1-fre-FR/Poule-Mouillette.jpg").open
petit_chef = Activity.new(name: "La poule mouillette",
  description: "Un restaurant interactif où les enfants peuvent participer à la préparation de leurs repas sous la 
                supervision de chefs professionnels. Une expérience culinaire ludique et éducative.",
  category: "Cafés et restaurants",
  address: "15 rue Paul Bellamy, 44100 Nantes",
  phone_number: "02 40 98 76 54",
  url: "https://la-poule-mouillette-nantes.com",
  stroller: true,
  changing_table: true,
  high_chair: true,
  kids_friendly: true,
  public_transport: true,
  public_transport_detail: "",
  car_park: false,
  car_park_detail: "",
  bike_park: true,
  bike_park_detail: "Parking vélo sécurisé")
petit_chef.photo.attach(io: file, filename: "petitchef.jpg", content_type: "image/jpg")
petit_chef.save

# Restaurant 3: La Crêperie Enchantée
file = URI.parse("https://resize-elle.ladmedia.fr/rcrop/638,,forcex/img/var/plain_site/storage/images/loisirs/sorties/dossiers/cafe-pour-enfants-cafe-poussette/kid-s-cafe-le-9-3-4/80852093-1-fre-FR/Kid-s-cafe-Le-9-3-4.jpg").open
creperie_enchantee = Activity.new(name: "La Crêperie Enchantée",
  description: "Une crêperie magique avec des crêpes aux formes amusantes et des garnitures colorées. Les enfants 
                peuvent créer leurs propres crêpes et participer à des ateliers de décoration.",
  category: "Cafés et restaurants",
  address: "13 Rue des Halles, 44000 Nantes",
  phone_number: "02 40 11 22 33",
  url: "https://creperieenchantee.fr",
  stroller: true,
  changing_table: false,
  high_chair: true,
  kids_friendly: true,
  public_transport: true,
  public_transport_detail: "Bus: Ligne 42, arrêt 'Contes de Fées'",
  car_park: true,
  car_park_detail: "Parking payant à proximité",
  bike_park: true,
  bike_park_detail: "Arceaux à vélos devant le restaurant")
creperie_enchantee.photo.attach(io: file, filename: "creperieenchantee.jpg", content_type: "image/jpg")
creperie_enchantee.save

# Restaurant 4: Le Safari Gourmand
file = URI.parse("https://lh3.googleusercontent.com/p/AF1QipNr1-5ggHg4_cW3Jdb8ZZ2DSXaH3fcdKYN9x3zn=s1360-w1360-h1020").open
safari_gourmand = Activity.new(name: "Le Safari Gourmand",
  description: "Un restaurant à thème safari avec des plats inspirés de la cuisine du monde. Les enfants peuvent manger dans des cabanes en forme d'animaux et participer à des chasses au trésor culinaires.",
  category: "Cafés et restaurants",
  address: "25 rue rene Coty, 44980 Ste Luce S/ Loire",
  phone_number: "02 40 44 55 66",
  url: "https://safarigourmand-nantes.com",
  stroller: true,
  changing_table: true,
  high_chair: true,
  kids_friendly: true,
  public_transport: true,
  public_transport_detail: "Bus: Ligne C7, arrêt 'Eglise'",
  car_park: true,
  car_park_detail: "Parking gratuit",
  bike_park: true,
  bike_park_detail: "Parking vélo")
safari_gourmand.photo.attach(io: file, filename: "safarigourmand.jpg", content_type: "image/jpg")
safari_gourmand.save

# Restaurant 5: La Pizza des Artistes
file = URI.parse("https://media.ouest-france.fr/v1/pictures/MjAyMDAxOGI4YmEwMDk2MTAwNWVhMzJmNWQ4Yjc1OGE3ZmQ4YTk?width=630&height=354&focuspoint=47%2C58&cropresize=1&client_id=bpeditorial&sign=d1a32c4b278357e4463291c4400cb679122419cb5a70977f59e8850afa00db65").open
pizza_artistes = Activity.new(name: "La Pizza des Artistes",
  description: "Une pizzeria où les enfants peuvent créer leur propre pizza en la décorant comme une œuvre d'art. 
                Des ateliers de peinture sur pizza sont organisés régulièrement.",
  category: "Cafés et restaurants",
  address: "12 bld des Poilus, 44000 Nantes",
  phone_number: "02 40 77 88 99",
  url: "https://pizzaartistes.fr",
  stroller: true,
  changing_table: false,
  high_chair: true,
  kids_friendly: true,
  public_transport: true,
  public_transport_detail: "Bus: Ligne 56, arrêt 'Galerie'",
  car_park: false,
  car_park_detail: "",
  bike_park: true,
  bike_park_detail: "Arceaux à vélos à l'entrée")
pizza_artistes.photo.attach(io: file, filename: "pizzaartistes.jpg", content_type: "image/jpg")
pizza_artistes.save

# Restaurant 6: Le Château des Smoothies
file = URI.parse("https://resize-elle.ladmedia.fr/rcrop/638,,forcex/img/var/plain_site/storage/images/loisirs/sorties/dossiers/cafe-pour-enfants-cafe-poussette/zeplegraounde/80851781-1-fre-FR/Zeplegraounde.jpg").open
chateau_smoothies = Activity.new(name: "Le Château des Smoothies",
  description: "Un restaurant healthy dans un décor de château médiéval. Les enfants peuvent créer leurs propres 
                smoothies et participer à des quêtes nutritionnelles amusantes.",
  category: "Cafés et restaurants",
  address: "3 rue du chateau, 44400 Nantes",
  phone_number: "02 40 10 20 30",
  url: "https://chateausmoothies-nantes.com",
  stroller: true,
  changing_table: true,
  high_chair: true,
  kids_friendly: true,
  public_transport: true,
  public_transport_detail: "Tram: Ligne 1, arrêt 'Duchesse Anne'",
  car_park: true,
  car_park_detail: "Parking souterrain à 200m",
  bike_park: true,
  bike_park_detail: "Parking vélo sécurisé dans la cour du château")
chateau_smoothies.photo.attach(io: file, filename: "chateausmoothies.jpg", content_type: "image/jpg")
chateau_smoothies.save

# Restaurant 7: Le Jardin Secret
file = URI.parse("https://www.silencecapousse-chezvous.fr/media/images/298/rectangle/w900/1581937270/Enfants-Potager-art.jpg").open
jardin_secret = Activity.new(name: "Le Jardin Secret",
  description: "Un restaurant bio avec un potager pédagogique. Les enfants peuvent cueillir leurs propres 
                légumes et apprendre à cuisiner des plats simples et sains.",
  category: "Cafés et restaurants",
  address: "18 Rue des Hortensias, 44000 Nantes",
  phone_number: "02 40 33 44 55",
  url: "https://jardinsecret-nantes.fr",
  stroller: true,
  changing_table: true,
  high_chair: true,
  kids_friendly: true,
  public_transport: true,
  public_transport_detail: "Bus: Ligne 87, arrêt 'Potager'",
  car_park: true,
  car_park_detail: "Petit parking gratuit",
  bike_park: true,
  bike_park_detail: "Arceaux à vélos dans le jardin")
jardin_secret.photo.attach(io: file, filename: "jardinsecret.jpg", content_type: "image/jpg")
jardin_secret.save

# Restaurant 8: Le Vaisseau Spatial
file = URI.parse("https://www.designmaroc.com/blog/2016/06/01/restaurant-bio-enfants-paris/").open
vaisseau_spatial = Activity.new(name: "Le Vaisseau Spatial",
  description: "Un restaurant futuriste où les plats sont servis par des robots. Les enfants peuvent jouer à des 
                jeux vidéo éducatifs sur des tablettes pendant que leurs repas sont préparés.",
  category: "Cafés et restaurants",
  address: "15 rue André Tardieu, 44000 Nantes",
  phone_number: "02 40 66 77 88",
  url: "https://vaisseauspatial.com",
  stroller: true,
  changing_table: true,
  high_chair: true,
  kids_friendly: true,
  public_transport: true,
  public_transport_detail: "Tram: Ligne 5, arrêt 'Station Spatiale'",
  car_park: true,
  car_park_detail: "Grand parking avec bornes de recharge électrique",
  bike_park: true,
  bike_park_detail: "Parking vélo high-tech sécurisé")
vaisseau_spatial.photo.attach(io: file, filename: "vaisseauspatial.jpg", content_type: "image/jpg")
vaisseau_spatial.save

# Restaurant 9: La Ferme Rigolote
file = URI.parse("https://www.mylittleparis.com/_ipx/_/https://api.mylittleparis.com/uploads/2022/06/24/article-grand-doyenne-2400-1333.jpg").open
ferme_rigolote = Activity.new(name: "La Ferme Rigolote",
  description: "Un restaurant-ferme où les enfants peuvent caresser des animaux, participer à la traite des vaches et 
                déguster des produits frais de la ferme. Des animations autour de la vie à la ferme sont proposées.",
  category: "Cafés et restaurants",
  address: "Chemin de La Longère, 44470 Carquefou",
  phone_number: "02 40 99 00 11",
  url: "https://fermerigolote-nantes.fr",
  stroller: true,
  changing_table: true,
  high_chair: true,
  kids_friendly: true,
  public_transport: true,
  public_transport_detail: "Bus: Ligne 101, arrêt 'Ferme Pédagogique'",
  car_park: true,
  car_park_detail: "Grand parking en terre battue",
  bike_park: true,
  bike_park_detail: "Râteliers à vélos en bois")
ferme_rigolote.photo.attach(io: file, filename: "fermerigolote.jpg", content_type: "image/jpg")
ferme_rigolote.save

# Restaurant 10: L'Aquarium Gourmand
file = URI.parse("https://img.freepik.com/photos-premium/restaurant-du-recif-est-entoure-grand-aquarium_865967-43503.jpg?w=826").open
aquarium_gourmand = Activity.new(name: "L'Aquarium Gourmand",
  description: "Un restaurant avec de grands aquariums où les enfants peuvent observer des poissons exotiques 
                tout en mangeant. Des menus spéciaux 'sirène' et 'pirate' sont proposés aux enfants.",
  category: "Cafés et restaurants",
  address: "Route de Gachet, 44470 Carquefou",
  phone_number: "02 40 22 33 44",
  url: "https://aquariumgourmand.com",
  stroller: true,
  changing_table: true,
  high_chair: true,
  kids_friendly: true,
  public_transport: true,
  public_transport_detail: "Bus: Ligne 72, arrêt 'Docks'",
  car_park: true,
  car_park_detail: "Parking couvert payant",
  bike_park: true,
  bike_park_detail: "Arceaux à vélos devant le restaurant")
aquarium_gourmand.photo.attach(io: file, filename: "aquariumgourmand.jpg", content_type: "image/jpg")
aquarium_gourmand.save!

# ###############################################

puts "creating espace jeux"

file = URI.parse("https://www.sainte-luce-loire.com/medias/2021/07/royal-kids-web-1240x523.jpg").open
royal_kids = Activity.new(name: "Royal Kids",
description: "Royal Kids est un parc de jeux intérieur pour enfants offrant une variété d'activités ludiques et sportives. Les enfants peuvent profiter de structures gonflables, toboggans, piscines à balles, parcours d'obstacles et zones de jeux adaptées à différents âges. C'est un endroit idéal pour les anniversaires et les sorties en famille, permettant aux enfants de s'amuser en toute sécurité.",
category: "Espaces de jeu",
address: "12 Rue Marcel Dassault, 44980 Sainte-Luce-sur-Loire",
phone_number: "02 40 25 21 21",
url: "https://www.royalkids.fr/parcs/sainte_luce_sur_loire",
stroller: true,
changing_table: true,
high_chair: true,
kids_friendly: true,
public_transport: true,
public_transport_detail: "Bus: Ligne 87, arrêt 'Marcel Dassault'",
car_park: true,
car_park_detail: "Parking gratuit sur place",
bike_park: true,
bike_park_detail: "Arceaux à vélos disponibles")
royal_kids.photo.attach(io: file, filename: "royalkids.jpg", content_type: "image/jpg")
royal_kids.save!

file = URI.parse("https://www.galipy.com/wp-content/uploads/2016/04/ac03-500x500.jpg").open
galipy = Activity.new(name: "Galipy",
description: "Galipy est un espace de jeux intérieur pour enfants situé à Saint-Sébastien-sur-Loire. Il propose des structures de jeux adaptées à différents âges, des toboggans, des piscines à balles, et des parcours d'obstacles. C'est un lieu idéal pour que les enfants se dépensent et s'amusent en toute sécurité, quel que soit le temps.",
category: "Espaces de jeu",
address: "2 Rue Marie Curie, 44230 Saint-Sébastien-sur-Loire",
phone_number: "02 40 34 90 90",
url: "https://www.galipy.com",
stroller: true,
changing_table: true,
high_chair: true,
kids_friendly: true,
public_transport: true,
public_transport_detail: "Bus: Ligne 30, arrêt 'Frères Lumière'",
car_park: true,
car_park_detail: "Parking gratuit sur place",
bike_park: true,
bike_park_detail: "Arceaux à vélos disponibles")
galipy.photo.attach(io: file, filename: "galipy.jpg", content_type: "image/jpg")
galipy.save!

file = URI.parse("https://nidoludo.fr/wp-content/uploads/2024/07/Capture-decran-2024-07-17-a-15.38.34-1024x387.png").open
nidoludo = Activity.new(name: "Nidoludo",
description: "Nidoludo est un lieu pensé pour les familles avec jeunes enfants au cœur de Nantes. 
              Il propose une aire de jeux moderne et cosy de 100m2 pour les enfants de 0 à 6 ans, 
              avec des jeux d'imitation, de musique et de motricité. Les parents peuvent profiter 
              d'un salon de thé pendant que les enfants s'amusent. Nidoludo offre également une programmation 
              d'ateliers variés pour les enfants de 0 à 10 ans, comme l'éveil musical, le yoga, le théâtre et le cirque.",
category: "Espaces de jeu",
address: "4 Rue de l'Héronnière, 44000 Nantes",
phone_number: "06 51 88 36 35",
url: "https://nidoludo.fr",
stroller: true,
changing_table: true,
high_chair: true,
kids_friendly: true,
public_transport: true,
public_transport_detail: "Tramway: Ligne 1, proche du centre-ville",
car_park: true,
car_park_detail: "Parkings à proximité dans le centre-ville",
bike_park: true,
bike_park_detail: "Arceaux à vélos disponibles à proximité")
nidoludo.photo.attach(io: file, filename: "nidoludo.png", content_type: "image/png")
nidoludo.save!

puts "creating mediatheque"

file = URI.parse("https://files.structurae.net/files/350high/2018/la_mediatheque_1.jpg").open
mediatheque_jacques_demy = Activity.new(name: "Médiathèque Jacques Demy",
description: "La médiathèque Jacques Demy est la plus importante du réseau de la bibliothèque municipale de Nantes. Elle offre une vaste collection de livres, documents précieux et contenus multimédias. Le bâtiment, construit en 1985, abrite également un musée de l'imprimerie et un centre d'études verniennes. C'est un lieu de culture et d'animation idéal pour les familles et les enfants[1][2].",
category: "Lieux culturels",
address: "24 Quai de la Fosse, 44000 Nantes",
phone_number: "02 40 41 95 95",
url: "https://bibliotheque.nantes.fr/bibliotheques/mediatheque-espace-jacques-demy/",
stroller: true,
changing_table: true,
high_chair: false,
kids_friendly: true,
public_transport: true,
public_transport_detail: "Tramway: Ligne 1, arrêt 'Médiathèque'",
car_park: true,
car_park_detail: "Parking à proximité",
bike_park: true,
bike_park_detail: "Station Bicloo à proximité")
mediatheque_jacques_demy.photo.attach(io: file, filename: "mediatheque_jacques_demy.jpg", content_type: "image/jpg")
mediatheque_jacques_demy.save!

file = URI.parse("https://api-infonantes.nantesmetropole.fr/banque/public/images/lieux/c/3-E3657-cj-FGuepin-01.jpg").open
floresca_guepin = Activity.new(name: "Médiathèque Floresca Guépin",
  description: "La Médiathèque Floresca Guépin est un espace culturel moderne offrant une large collection de livres, CD, DVD et ressources numériques. Elle propose des espaces dédiés aux enfants avec des animations régulières, des ateliers de lecture et des activités ludiques pour tous les âges.",
  category: "Lieux culturels",
  address: "15 Rue de la Haluchère, 44300 Nantes",
  phone_number: "02 40 93 41 60",
  url: "https://bibliotheque.nantes.fr/bibliotheques/mediatheque-est-floresca-guepin/",
  stroller: true,
  changing_table: true,
  high_chair: false,
  kids_friendly: true,
  public_transport: true,
  public_transport_detail: "Tramway: Ligne 1, arrêt 'Haluchère'",
  car_park: true,
  car_park_detail: "Parking gratuit à proximité",
  bike_park: true,
  bike_park_detail: "Arceaux à vélos disponibles")
floresca_guepin.photo.attach(io: file, filename: "floresca_guepin.jpg", content_type: "image/jpg")
floresca_guepin.save!

file = URI.parse("https://api-infonantes.nantesmetropole.fr/banque/public/images/lieux/l/3-E4149-LisaBresner-02.jpg").open
lisa_bresner = Activity.new(name: "Médiathèque Lisa Bresner",
  description: "La Médiathèque Lisa Bresner est un lieu culturel convivial proposant une riche collection de documents pour tous les âges. Elle dispose d'un espace jeunesse avec des livres, des jeux et des animations adaptés aux enfants, favorisant la découverte et l'apprentissage.",
  category: "Lieux culturels",
  address: "23 Boulevard Emile Romanet, 44100 Nantes",
  phone_number: "02 40 41 54 00",
  url: "https://bibliotheque.nantes.fr/bibliotheques/mediatheque-lisa-bresner/",
  stroller: true,
  changing_table: true,
  high_chair: false,
  kids_friendly: true,
  public_transport: true,
  public_transport_detail: "Tramway: Ligne 1, arrêt 'Romanet'",
  car_park: true,
  car_park_detail: "Parking gratuit sur place",
  bike_park: true,
  bike_park_detail: "Arceaux à vélos disponibles")
lisa_bresner.photo.attach(io: file, filename: "lisa_bresner.jpg", content_type: "image/jpg")
lisa_bresner.save!

file = URI.parse("https://api-infonantes.nantesmetropole.fr/banque/public/images/lieux/l/3-E26-LuceCourville-01.jpg").open
luce_courville = Activity.new(name: "Médiathèque Luce Courville",
  description: "La Médiathèque Luce Courville est un espace culturel dynamique offrant une variété de ressources pour tous les publics. Elle propose un coin enfants avec des livres, des jeux éducatifs et des animations régulières, encourageant la lecture et la créativité chez les plus jeunes.",
  category: "Lieux culturels",
  address: "1 Rue Eugène Thomas, 44300 Nantes",
  phone_number: "02 40 41 53 50",
  url: "https://bibliotheque.nantes.fr/bibliotheques/mediatheque-nord-luce-courville/",
  stroller: true,
  changing_table: true,
  high_chair: false,
  kids_friendly: true,
  public_transport: true,
  public_transport_detail: "Bus: Ligne C2, arrêt 'Chauvinière'",
  car_park: true,
  car_park_detail: "Parking gratuit à proximité",
  bike_park: true,
  bike_park_detail: "Arceaux à vélos disponibles")
luce_courville.photo.attach(io: file, filename: "luce_courville.jpg", content_type: "image/jpg")
luce_courville.save!

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

camille_rating_2 = Rating.create!(user: manu,
  activity: nidoludo,
  visit_date: Date.today + 4,
  rating: 5,
  comment: "Des jeux d'imitation avec les enfants, de bons apres-midi en famille! super goûter après sur place!",
  stroller: true,
  changing_table: true,
  high_chair: true,
  kids_friendly: true)

manu_rating_1 = Rating.create!(user: manu,
  activity: musee_art_nantes,
  visit_date: Date.today + 2,
  rating: 5,
  comment: "access avec poussette grâce à l'ascenseur! et table à langer. Espace de jeux et salon de thé adaptés aux enfants",
  stroller: true,
  changing_table: true,
  high_chair: false,
  kids_friendly: true)

puts "end creating ratings"
# ###############################################

# ################création favourites#################

puts "creating favourites"
camille_fav = Favourite.create!(user: camille, activity: musee_art_nantes)
camille_fav1 = Favourite.create!(user: camille, activity: planetarium)
camille_fav2 = Favourite.create!(user: camille, activity: nidoludo)
camille_fav3 = Favourite.create!(user: camille, activity: machines_ile)

manu_fav = Favourite.create!(user: manu, activity: jardin_enfants_proce)
manu_fav1 = Favourite.create!(user: manu, activity: les_gamines)
manu_fav1 = Favourite.create!(user: manu, activity: musee_art_nantes)

puts "end creating favourites"
# ###############################################
