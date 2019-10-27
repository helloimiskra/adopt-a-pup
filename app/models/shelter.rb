class Shelter < ActiveRecord::Base 
    belongs_to :city, optional: true
    has_many :pets
    belongs_to :user, optional: true
    

    
end
