class Shelter < ActiveRecord::Base 
    has_many :cities, through: :pets
    belongs_to :user, optional: true
    has_many :pets


    

    
end
