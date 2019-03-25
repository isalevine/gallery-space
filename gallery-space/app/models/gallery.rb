class Gallery < ApplicationRecord
  # belongs_to :user is set to Optional for testing
  # purposes - validation IS needed for final product!
  belongs_to :user, optional: true
  has_many :images
  has_many :settings

  validates :name, presence: true
  # is uniqueness necessary or not? (is it OK for 2 users
  # to create the same gallery name??)
  validates :name, uniqueness: true
  validates :theme, presence: true

end
