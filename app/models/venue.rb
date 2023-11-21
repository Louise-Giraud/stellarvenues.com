class Venue < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  # uniqueness: true
  validates :address, presence: true
  validates :capacity, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
