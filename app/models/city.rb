class City < ActiveRecord::Base 
    has_many :shelters
    has_many :pets, through: :shelters
    validates :name, uniqueness: true
    
end