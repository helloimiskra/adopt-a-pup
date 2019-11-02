class AddProperUserIdToShelters < ActiveRecord::Migration[6.0]
  def change
    add_reference :shelters, :user, foreign_key: true
  end
end
