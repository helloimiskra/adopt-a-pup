class RemoveCityIdFromShelters < ActiveRecord::Migration[6.0]
  def change

    remove_column :shelters, :city_id, :integer
  end
end
