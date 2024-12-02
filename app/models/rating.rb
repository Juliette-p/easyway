class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  COMMENT_MAX = 150

  validates :comment, length: { maximum: COMMENT_MAX }
  validates :rating, presence: true, inclusion: { in: (0..5) }
end
