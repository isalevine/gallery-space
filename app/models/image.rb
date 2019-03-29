class Image < ApplicationRecord
  belongs_to :gallery
  # validates :title, presence: true
  # validates :artist, presence: true
  # validates :medium,  presence: true

  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
