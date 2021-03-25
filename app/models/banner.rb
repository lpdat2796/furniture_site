class Banner < ApplicationRecord
  # Mount to file upload
  mount_uploader :image, ImageUploader
end