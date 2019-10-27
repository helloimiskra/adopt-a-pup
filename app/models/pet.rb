class Pet < ActiveRecord::Base 
    belongs_to :shelter
    belongs_to :user, optional: true
    
    def self.by_pet_type(pet_type)
        where(pet_type: pet_type)
    end
end
