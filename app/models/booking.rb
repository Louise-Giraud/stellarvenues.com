class Booking < ApplicationRecord
  belongs_to :venue
  belongs_to :user
  validates :date, presence: true
  validate :expiration_date_cannot_be_in_the_past

  def expiration_date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end

  enum status: {
    pending: 0,
    confirmed: 1,
    declined: 2
  }
end
