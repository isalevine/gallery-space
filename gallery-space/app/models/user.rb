class User < ApplicationRecord
  has_secure_password

  has_many :galleries
  has_many :images, through: :galleries
  has_many :settings, through: :galleries
  has_many :friends

  validates :user_name, presence: true
end
