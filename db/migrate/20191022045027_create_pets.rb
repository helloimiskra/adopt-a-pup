class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :type
      t.string :breed
      t.text :description
      t.integer :shelter_id
      t.integer :user_id
      t.boolean :adopted
    end
  end
end
