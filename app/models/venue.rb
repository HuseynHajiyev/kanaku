class Venue < ApplicationRecord
  belongs_to :city
  has_many :journey_venues, dependent: :destroy
  has_many :venue_categories, dependent: :destroy
  has_many :journeys, through: :journey_venues
  validates :city, :address, :name, presence: true
  validates :address, uniqueness: true

  has_many_attached :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  include PgSearch::Model
  pg_search_scope :search_by_name,
                  against: %i[name],
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }
end
