class Location < ActiveRecord::Base 
    has_many :shelters
    has_many :pets, through: :shelters
    
end