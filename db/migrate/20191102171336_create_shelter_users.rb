class CreateShelterUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :shelter_users do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :shelter, foreign_key: true
    end
  end
end
