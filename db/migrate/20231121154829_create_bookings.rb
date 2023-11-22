class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.date :date
      t.references :venue, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :booked, default: false

      t.timestamps
    end
  end
end
