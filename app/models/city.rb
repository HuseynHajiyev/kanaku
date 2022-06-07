class City < ApplicationRecord
  has_many :venues, dependent: :destroy
end
