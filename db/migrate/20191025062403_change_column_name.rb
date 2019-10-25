class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :shelters, :location_id, :city_id
  end
end
