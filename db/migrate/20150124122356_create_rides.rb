class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.string :origin
      t.float :origin_lat
      t.float :origin_long
      t.string :destination
      t.float :destination_lat
      t.float :destination_long
      t.date :departure_date
      t.time :departure_time
      t.integer :number_of_seats
      t.integer :number_of_seats_occupied
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
