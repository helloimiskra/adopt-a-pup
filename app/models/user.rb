class User < ActiveRecord::Base 
    has_secure_password
    validates :email, uniqueness: true
    validates :username, uniqueness: true
    validates :first_name, format: { without: /[0-9]/, message: "does not allow numbers" }
    validates :last_name, format: { without: /[0-9]/, message: "does not allow numbers" }
    has_many :shelters
    devise :omniauthable
    
    def name
        self.first_name + " " + self.last_name
    end

    def self.from_omniauth(auth)
    
        where(email: auth.info.email).first_or_create do |user|
          user.name = auth.info.name
          user.email = auth.info.email
        end
      end

      def self.find_for_oauth(auth, current_user)
    
        email = auth.info.email
        user = User.where(:email => email).first
        
        if not self.where(email: auth.info.email).exists?
            
            if user.nil?
                user = User.new(name: auth.info.name, email: email ? auth.info.email : "#{auth.uid}@#{auth.provider}.com", password: Devise.friendly_token[0,20])
                user.save!
            end
        end
    user
  end

end
