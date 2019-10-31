class AddCityToPets < ActiveRecord::Migration[6.0]
  def change
    add_reference :pets, :city, foreign_key: true
  end
end
