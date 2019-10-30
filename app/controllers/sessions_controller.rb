class SessionsController < ApplicationController

    def new
        @user = User.new

    end

    def create
        if !params[:user][:username].blank?
            @user = User.find_by(username: params[:user][:username])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                redirect_to '/login'
            end
        else
            @user = User.find_or_create_by(uid: auth['uid']) do |u|
                u.name = auth['info']['name']
                u.email = auth['info']['email']
            end
            session[:user_id] = @user.id
            render 'users/welcome'
            end

        end

            
       

    end
 
    def destroy
        session.delete :user_id
        redirect_to '/'
    end
     
    private
     
    def auth
        request.env['omniauth.auth']
    end
    
end
