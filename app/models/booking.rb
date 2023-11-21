class Booking < ApplicationRecord
  belongs_to :venue
  belongs_to :user
  validates :date, presence: true
end
