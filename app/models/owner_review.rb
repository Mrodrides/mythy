class OwnerReview < ApplicationRecord
  belongs_to :booking

  validates :owner_rating, presence: true, numericality: { only_integer: true }
  validates :creature_rating, presence: true, numericality: { only_integer: true }
end
