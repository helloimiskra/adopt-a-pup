class Pet < ActiveRecord::Base 
    belongs_to :shelter
    belongs_to :user, optional: true
    
end
