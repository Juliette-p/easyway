class Activity < ApplicationRecord
  has_many :favourites, dependent: :destroy
  has_many :ratings, dependent: :destroy

  ACTIVITY_CATEGORY = ["Cafés et restaurants", "Parcs", "Lieux culturels", "Espaces de jeu"]

  validates :name, presence: true, length: { minimum: 2 }
  validates :category, presence: true, inclusion: { in: ACTIVITY_CATEGORY }
  validates :address, presence: true

  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_address,
  against: [:address],
  using: {
    tsearch: { prefix: true }
  }
end
