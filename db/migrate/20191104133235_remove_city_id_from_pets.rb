class RemoveCityIdFromPets < ActiveRecord::Migration[6.0]
  def change
    change_table :pets do |t|
      t.remove_references :city
    end
  end
end


