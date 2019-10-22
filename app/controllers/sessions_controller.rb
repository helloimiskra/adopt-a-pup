class SessionsController < ApplicationController

    def new
        @user = User.new

    end

    def create
        @user = User.find_by(name: params[:user][:username])

        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:alert] = 'Try Again.'
            redirect_to '/signin'
        end

    end

    def destroy
        session.delete :user_id
        redirect_to '/home'
    end

end
