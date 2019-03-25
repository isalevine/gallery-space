class Image < ApplicationRecord
  belongs_to :gallery, optional: true
  validates :title, presence: true
  validates :artist, presence: true
  validates :medium,  presence: true
  validates :link, presence: true
end
