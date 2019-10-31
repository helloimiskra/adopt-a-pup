class Pet < ActiveRecord::Base 
    belongs_to :shelter
    belongs_to :user
    belongs_to :city
    validates :name, format: { without: /[0-9]/, message: "does not allow numbers" }
    validates :pet_type, format: { without: /[0-9]/, message: "does not allow numbers" }
    validates :breed, format: { without: /[0-9]/, message: "does not allow numbers" }
    validates :gender, format: { without: /[0-9]/, message: "does not allow numbers" }



    def self.boys
        where(gender: "Boy")
    end
    
    def self.girls
        where(gender: "Girl")
    end
end
