class AddInitiatorToRides < ActiveRecord::Migration
  def change
    add_column :rides, :initiator_id, :integer
  end
end
