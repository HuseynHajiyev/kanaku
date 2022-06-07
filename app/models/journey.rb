class Journey < ApplicationRecord
  belongs_to :user
  has_many :journey_venues, dependent: :destroy
  has_many :venues, through: :journey_venues
end
