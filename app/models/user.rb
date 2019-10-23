class User < ActiveRecord::Base 
    has_secure_password
    validates :email, uniqueness: true
    validates :username, uniqueness: true
    validates :first_name, format: { without: /[0-9]/, message: "does not allow numbers" }
    validates :last_name, format: { without: /[0-9]/, message: "does not allow numbers" }

    def name
        self.first_name + " " + self.last_name
    end

end
