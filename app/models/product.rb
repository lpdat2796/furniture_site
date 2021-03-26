class Product < ApplicationRecord
  # Assoications
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :product_images
  has_many :color_products
  has_many :colors, through: :color_products
  has_many :material_products
  has_many :materials, through: :material_products
end