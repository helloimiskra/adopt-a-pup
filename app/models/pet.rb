class Pet < ActiveRecord::Base 
    belongs_to :shelter
    belongs_to :user, optional: true
    validates :name, format: { without: /[0-9]/, message: "does not allow numbers" }
    validates :pet_type, format: { without: /[0-9]/, message: "does not allow numbers" }
    validates :breed, format: { without: /[0-9]/, message: "does not allow numbers" }
    validates :gender, format: { without: /[0-9]/, message: "does not allow numbers" }

    
    def self.by_pet_type(pet_type)
        where(pet_type: pet_type)
    end

    
end
