class DropLocationsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :locations do |t|
      t.string :city, null: false
      t.string :country, null: false 
    end
  end
end
