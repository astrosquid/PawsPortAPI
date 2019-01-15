class User < ApplicationRecord
  has_many :stamps
  has_many :breeds, through: :stamps
end
