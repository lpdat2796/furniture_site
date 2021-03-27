class User < ApplicationRecord
  # Encode password
  has_secure_password
end