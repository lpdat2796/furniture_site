class MaterialProduct < ApplicationRecord
  # Assoications
  belongs_to :material
  belongs_to :product
end