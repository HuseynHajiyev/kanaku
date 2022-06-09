class Venue < ApplicationRecord
  belongs_to :city
  has_many :journey_venues, dependent: :destroy
  has_many :venue_categories, dependent: :destroy
  has_many :journeys, through: :journey_venues
  validates :city, :address, :rating, :name, :latitude, :longitude, presence: true
  validates :address, uniqueness: true

  has_many_attached :photos
end
