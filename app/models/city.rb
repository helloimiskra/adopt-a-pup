class City < ActiveRecord::Base 
 #   has_many :pets
  #  has_many :shelters, through: :pets
    validates :name, uniqueness: true
end

# creating a pet using a nested form to tell object what city its located in 
