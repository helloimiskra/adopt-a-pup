class User < ActiveRecord::Base 
    has_secure_password
    validates :email, uniqueness: true
    validates :username, uniqueness: true
    validates :name, format: { without: /[0-9]/, message: "does not allow numbers" }
    has_many :shelters, through: :pets
    has_many :pets

    def self.from_google(auth)
        refresh_token = auth.credentials.refresh_token
        if (found_user = User.find_by(email: auth.info.email))
            found_user.google_uid = auth.credentials.token
            found_user.google_refresh_token = refresh_token if refresh_token.present?
            return found_user
        else
            new_user = User.create do |u|
                u.email = auth.info.email
                u.name = auth.info.name
                u.username = auth.info.email
                u.google_uid = auth.credentials.token
                u.google_refresh_token = refresh_token if refresh_token.present?
                u.password = Sysrandom.hex(30)
            end
            return new_user
        end
    end

end