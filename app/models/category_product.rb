class CategoryProduct < ApplicationRecord
  # Associations
  belongs_to :product
  belongs_to :category
end