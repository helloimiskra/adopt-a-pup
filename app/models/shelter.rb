class Shelter < ActiveRecord::Base 
    belongs_to :location
    has_many :pets
    
end
