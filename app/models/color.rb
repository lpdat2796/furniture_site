class Color < ApplicationRecord
  # Assoications
  has_many :color_products
  has_many :products, through: :color_products
end