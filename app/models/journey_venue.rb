class JourneyVenue < ApplicationRecord
  belongs_to :venue
  belongs_to :journey
end
