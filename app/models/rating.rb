class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  validates :comment, length: { maximum: 150 }
  validates :rating, presence: true, inclusion: { in: (0..5) }
end
