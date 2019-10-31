class DropUserIdFromPets < ActiveRecord::Migration[6.0]
  def change
    remove_column :pets, :user_id, :integer
  end
end
