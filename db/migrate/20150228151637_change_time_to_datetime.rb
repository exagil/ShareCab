class ChangeTimeToDatetime < ActiveRecord::Migration
  def change
  	remove_column :rides, :departure_time
  	add_column :rides, :departure_time, :datetime
  end
end
