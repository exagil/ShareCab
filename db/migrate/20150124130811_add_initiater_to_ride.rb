class AddInitiaterToRide < ActiveRecord::Migration
  def change
    add_reference :rides, :initiater, index: true
    add_foreign_key :rides, :initiaters
  end
end
