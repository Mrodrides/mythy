class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :creature, foreign_key: true
      t.string :status, :default => "pending"
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
