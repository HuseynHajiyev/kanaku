class Venue < ApplicationRecord
  belongs_to :city
  has_many :journey_venues, dependent: :destroy
  has_many :venue_categories, dependent: :destroy
  has_many :journeys, through: :journey_venues

  has_many_attached :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
