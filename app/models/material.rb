class Material < ApplicationRecord
  # Assoications
  has_many :material_products
  has_many :products, through: :material_products
end