class Image < ApplicationRecord
  belongs_to :gallery, optional: true
  validates :title, presence: true
  validates :artist, presence: true
  validates :medium,  presence: true
  # validates :link, presence: true

  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
