class Creature < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  geocoded_by :address, latitude: :lat, longitude: :long
  after_validation :geocode, if: :will_save_change_to_address?

  # Carrierwave uploader for Cloudinary
  mount_uploader :picture, PhotoUploader

  validates :name, :address, :picture, :price, presence: true
  #validates :price, numericality: { greater_than: 0 }
end
