class RemoveUserIdFromShelters < ActiveRecord::Migration[6.0]
  def change

    remove_column :shelters, :user_id, :integer
  end
end
