class Product < ApplicationRecord
  # Assoications
  has_many :category_products, dependent: :destroy
  has_many :categories, through: :category_products
  has_many :product_images, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :price, presence: true
  validates :dimension_x, presence: true
  validates :dimension_y, presence: true
  validates :dimension_z, presence: true
  validates :amount, presence: true
  validates :card_image, presence: true
  validates :color, presence: true
  validates :material, presence: true

  # Mount to file upload
  mount_uploader :card_image, ImageUploader

  # Attributes
  attr_accessor :product_images_file_data
end