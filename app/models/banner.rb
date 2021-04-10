class Banner < ApplicationRecord
  # Mount to file upload
  mount_uploader :image, ImageUploader

  # Validations
  validates :name, presence: true
  validates :image, presence: true
end