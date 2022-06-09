class JourneyVenue < ApplicationRecord
  belongs_to :venue
  belongs_to :journey
  validates :venue, uniqueness: { scope: :journey }
end
