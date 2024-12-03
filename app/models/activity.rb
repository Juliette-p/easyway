class Activity < ApplicationRecord
  has_many :favourites, dependent: :destroy
  has_many :ratings, dependent: :destroy

  ACTIVITY_CATEGORY = ["Café et Resto", "Parc", "Lieu culturel", "Espace de jeux"]

  DESCRIPTION_MAX = 1330

  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :category, presence: true, inclusion: { in: ACTIVITY_CATEGORY }
  validates :address, presence: true
  validates :description, length: { maximum: DESCRIPTION_MAX }

  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_address_name,
  against: [:address, :name],
  using: {
    tsearch: { prefix: true }
  }
end
