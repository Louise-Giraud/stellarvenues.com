class Venue < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :name, presence: true
  # uniqueness: true
  validates :address, presence: true
  validates :capacity, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
