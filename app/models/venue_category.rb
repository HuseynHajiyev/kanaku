class VenueCategory < ApplicationRecord
  belongs_to :category
  belongs_to :venue
  validates :venue, uniqueness: { scope: :category }
end
