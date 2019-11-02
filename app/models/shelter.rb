class Shelter < ActiveRecord::Base 
    has_many :pets
    has_many :shelter_users
    has_many :users, through: :shelter_users

    validates :name, uniqueness: true
    
end
