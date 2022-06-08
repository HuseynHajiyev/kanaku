class City < ApplicationRecord
  has_many :venues, dependent: :destroy

  has_many_attached :photos
end
