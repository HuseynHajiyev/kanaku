class Venue < ApplicationRecord
  belongs_to :city
  has_many :journey_venues
  has_many :venue_categories
end
