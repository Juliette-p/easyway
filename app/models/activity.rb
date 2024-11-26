class Activity < ApplicationRecord
  has_many :favourites, dependent: :destroy
  has_many :ratings, dependent: :destroy

  ACTIVITY_CATEGORY = ["Cafés et restaurants", "Parcs", "Lieux culturels", "Espaces de jeu"]

  validates :name, presence: true, length: { minimum: 2 }
  validates :category, presence: true, inclusion: { in: ACTIVITY_CATEGORY }
  validates :address, presence: true

  has_one_attached :photo
end
