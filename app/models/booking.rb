class Booking < ApplicationRecord
  belongs_to :venue
  belongs_to :user
  validates :date, presence: true

  enum status: {
    pending: 0,
    confirmed: 1,
    declined: 2
  }
end
