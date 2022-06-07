class VenueCategory < ApplicationRecord
  belongs_to :venue
  belongs_to :category
end
