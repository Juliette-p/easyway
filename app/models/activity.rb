class Activity < ApplicationRecord
  has_many :favourites
  has_many :ratings
end
