class City < ApplicationRecord
  has_many :venues, dependent: :destroy

  has_many_attached :photos

  validates :name, presence: true, uniqueness: true
  validates :country_name, presence: true
  validates :description, presence: true
  validates :latitude, :longitude, presence: true
end
