class VenueCategory < ApplicationRecord
  belongs_to :categories
  belongs_to :venues
end
