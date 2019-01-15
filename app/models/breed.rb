class Breed < ApplicationRecord
  has_many :stamps
  has_many :users, through: :stamps
end
