class ChangeColumnNameForCities < ActiveRecord::Migration[6.0]
  def change
    rename_column :cities, :city, :name
  end
end
