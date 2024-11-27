class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  validates :rating, presence: true, inclusion: { in: (0..5) }
end
