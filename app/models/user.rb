class User < ApplicationRecord
  # Encode password
  has_secure_password

  # Associations
  has_many :orders

  # Enums
  enum role: { user: 0, admin: 1 }
  
  # Validations
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8, maximum: 38 }, if: -> { id.nil? }
  validates :full_name, presence: true
  validates :address, presence: true, if: -> { role == 'user' }
  validates :phone, presence: true, if: -> { role == 'user' }
  validates :age, presence: true, if: -> { role == 'user' }
end