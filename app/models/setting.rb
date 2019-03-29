class Setting < ApplicationRecord
  belongs_to :gallery

  validates :theme_name, presence: true
  validates :background_color, presence: true
  validates :font, presence: true
  # validates :audio, presence: true
end
