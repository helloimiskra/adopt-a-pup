class CreateShelters < ActiveRecord::Migration[6.0]
  def change
    create_table :shelters do |t|
      t.string :name
      t.string :address
      t.string :email
      t.integer :location_id
    end
  end
end
