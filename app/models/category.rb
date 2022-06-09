class Category < ApplicationRecord
  has_many :venue_categories, dependent: :destroy
  has_many :venues, through: :venue_categories
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
