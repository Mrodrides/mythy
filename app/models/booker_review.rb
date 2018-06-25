class BookerReview < ApplicationRecord
  belongs_to :booking

  validates :rating, presence: true, numericality: { only_integer: true }
end
