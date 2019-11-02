class RemoveUserFromShelters < ActiveRecord::Migration[6.0]
  def change
    change_table :shelters do |t|
      t.remove_references :user
    end
  end
end
