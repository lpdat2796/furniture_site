class Order < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :order_details
end