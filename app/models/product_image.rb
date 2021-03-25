class ProductImage < ApplicationRecord
  # Associations
  belongs_to :product

  # Mount to file upload
  mount_uploader :file_data, ImageUploader
end