class Setting < ApplicationRecord
  belongs_to :gallery, optional: true

  # validations are commented out for testing purposes--
  # revisit whether to include these checks once the
  # inline css/view-published-gallery view is working
  # ====================================================
  # validates :theme_name, presence: true
  # validates :background_color, presence: true
  # validates :font, presence: true
  # validates :audio, presence: true
end
