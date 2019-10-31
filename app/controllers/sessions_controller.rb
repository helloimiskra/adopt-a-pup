class SessionsController < ApplicationController

    def new
        @user = User.new

    end

    def create
          user = User.find_by(username: params[:username])
          user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to user_path(user.id)
      
    end

    def googleAuth
      access_token = request.env["omniauth.auth"]
      user = User.from_google(access_token)
    end

    #use auth instead of params ie: auth.username
 
    def destroy
        session.delete :user_id
        redirect_to '/'
    end
     
    private
     
    def auth
        request.env['omniauth.auth']
    end
    
    def from_omniauth(auth)
      user = User.where(provider: auth.provider, uid: auth.uid).first_or_initialize
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save
      return user
    end
end
