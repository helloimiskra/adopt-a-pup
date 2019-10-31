class City < ActiveRecord::Base 
    has_many :shelters, through: :pets
    has_many :pets
    validates :name, uniqueness: true
    
end

# creating a pet using a nested form to tell object what city its located in 
