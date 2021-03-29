class User < ApplicationRecord
  # Encode password
  has_secure_password
  
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8, maximum: 38 }, if: -> { id.nil? }
  validates :full_name, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :age, presence: true
end