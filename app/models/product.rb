class Product < ApplicationRecord
  # Assoications
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :product_images
  has_one :master_data
end