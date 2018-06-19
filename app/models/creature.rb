require 'open-uri'
require 'json'

class Creature < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  # Carrierwave uploader for Cloudinary
  mount_uploader :picture, PhotoUploader

  validates :name, :address, :picture, :price, presence: true
  #validates :price, numericality: { greater_than: 0 }

  def set_coordinates?
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{self.address}"
    address_serialized = open(url).read
    address = JSON.parse(address_serialized)
    unless address_serialized.include?("error")
      @address = address["results"][0]["formatted_address"]
      @lat = address["results"][0]["geometry"]["location"]["lat"].to_f
      @long = address["results"][0]["geometry"]["location"]["lng"].to_f
      return true
    end
    return false
  end
end
