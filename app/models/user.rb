class User < ActiveRecord::Base 
    has_secure_password
    validates :email, uniqueness: true
    validates :username, uniqueness: true
    validates :name, format: { without: /[0-9]/, message: "does not allow numbers" }
    has_many :shelters
    has_many :pets, through: :shelters
  

    def self.create_with_omniauth(auth)
      user = find_or_create_by(uid: auth['uid'], provider: auth['provider'])
      user.email = "#{auth['uid']}@#{auth['provider']}.com"
      user.password = auth['uid']
      user.name = auth['info']['name']
      if User.exists?(user.id)
           user
       else
           user.save!
          user
        end
    end

    def self.from_google(auth)
        refresh_token = auth.credentials.refresh_token
        if (found_user = User.find_by(email: auth.info.email))
            found_user.google_uid = auth.credentials.token
            found_user.google_refresh_token = refresh_token if refresh_token.present?
            return found_user
        else
            new_user = User.new do |u|
                u.email = auth.info.email
                u.name = auth.info.name
                u.google_uid = auth.credentials.token
                u.google_refresh_token = refresh_token if refresh_token.present?
                rand_password = RandomPasswordStrategy.random_password
                u.password = rand_password
                u.password_confirmation = rand_password
            end
            return new_user
        end
    end

end