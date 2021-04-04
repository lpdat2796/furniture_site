class Product < ApplicationRecord
  # Assoications
  has_many :category_products, dependent: :destroy
  has_many :categories, through: :category_products
  has_many :product_images, dependent: :destroy

  # Mount to file upload
  mount_uploader :card_image, ImageUploader

  # Attributes
  attr_accessor :product_images_file_data
end