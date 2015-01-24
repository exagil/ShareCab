class CreateRidings < ActiveRecord::Migration
  def change
    create_table :ridings do |t|
      t.references :user, index: true
      t.references :ride, index: true

      t.timestamps null: false
    end
    add_foreign_key :ridings, :users
    add_foreign_key :ridings, :rides
  end
end