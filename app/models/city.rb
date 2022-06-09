class City < ApplicationRecord
  has_many :venues, dependent: :destroy

  has_many_attached :photos

  validates :name, presence: true, uniqueness: true
  validates :name_country, presence: true
  validates :description, presence: true
  validates :latitude, :longitude, presence: true
end
