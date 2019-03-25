class User < ApplicationRecord
  has_many :galleries
  has_many :images, through: :galleries
  has_many :settings, through: :galleries
  has_many :friends

  validates :user_name, presence: true
  # FIND OUT: does numericality also include presence: true?
  # check if necessary to add optional: true to :age check
  validate :age, numericality: {only_integer: true}
end
