class Shelter < ActiveRecord::Base 
    belongs_to :location, optional: true
    has_many :pets

    
end
