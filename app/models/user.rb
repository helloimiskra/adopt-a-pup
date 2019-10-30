class User < ActiveRecord::Base 
    has_secure_password
    validates :email, uniqueness: true
    validates :username, uniqueness: true
    validates :name, format: { without: /[0-9]/, message: "does not allow numbers" }
    
    has_many :shelters
  
  

end
