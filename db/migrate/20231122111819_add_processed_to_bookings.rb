class AddProcessedToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :processed, :string
  end
end
