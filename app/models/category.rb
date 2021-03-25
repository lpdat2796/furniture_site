class Category < ApplicationRecord
  # Associations
  has_many :category_products
  has_many :products, through: :category_products
end