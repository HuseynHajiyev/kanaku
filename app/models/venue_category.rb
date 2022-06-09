class VenueCategory < ApplicationRecord
  belongs_to :categories
  belongs_to :venues
  validates :venue, uniqueness: { scope: :category }
end
