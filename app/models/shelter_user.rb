class ShelterUser < ActiveRecord::Base
    belongs_to :user
    belongs_to :shelter

end
