class AddNeuteredToPets < ActiveRecord::Migration[6.0]
  def change
    add_column :pets, :neutered, :boolean
  end
end
