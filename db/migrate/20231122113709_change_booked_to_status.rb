class ChangeBookedToStatus < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings, :booked
    remove_column :bookings, :processed
    add_column :bookings, :status, :integer, default: 0
  end
end
