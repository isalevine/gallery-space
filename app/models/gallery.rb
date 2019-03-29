class Gallery < ApplicationRecord
  # belongs_to :user is set to Optional for testing
  # purposes - validation IS needed for final product!
  belongs_to :user
  has_many :images
  has_many :settings

  # validations below are commented out for testing reasons.
  # when these validations are applied, the galleries/new
  # form crashes, saying @user = nil (can't run @user.id)
  validates :name, presence: true
  validates :theme, presence: true

end
