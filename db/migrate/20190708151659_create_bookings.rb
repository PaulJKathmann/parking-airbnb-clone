class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :space, foreign_key: true
      t.date :end_date
      t.date :start_date
      t.integer :cost
      t.string :status

      t.timestamps
    end
  end
end
