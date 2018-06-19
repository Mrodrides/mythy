class Creature < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, :address, :picture, :price, presence: true
  #validates :price, numericality: { greater_than: 0 }
end