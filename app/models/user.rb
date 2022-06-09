class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :journeys, dependent: :destroy

  has_one_attached :avatar
  validates :first_name, :last_name, :email, :user_name, presence: true
  validates :user_name, uniqueness: true
end
