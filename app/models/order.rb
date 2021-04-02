class Order < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :order_details
  has_one :order_delivery
end