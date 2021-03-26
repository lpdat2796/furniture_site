class ColorProduct < ApplicationRecord
  # Assoications
  belongs_to :product
  belongs_to :color
end