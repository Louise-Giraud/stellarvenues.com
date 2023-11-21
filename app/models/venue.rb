class Venue < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  # uniqueness: true
  validates :address, presence: true
end
