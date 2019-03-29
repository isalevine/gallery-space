class Setting < ApplicationRecord
  belongs_to :gallery

  validates :theme_name, presence: true
  validates :background_color, presence: true
  validates :font, presence: true
  # validates :youtube_URL_snippet, presence: true
end
