class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)

        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            if @user.shelter_admin == true
                redirect_to new_shelter_path
            else
                redirect_to user_path(@user)
            end
        else
            render :new
        end
    end


    def show
        @user = User.find_by(id: params[:id])

        if current_user != @user 
            redirect_to '/'
        end
    end

    def edit
        @user = User.find_by(id: params[:id])
    end

    def update
        @user = current_user
        @user.update(user_params)
        redirect_to user_path(@user)
    end


    private

    def user_params
        params.require(:user).permit(:name, :username, :password, :email, :shelter_admin, :uid, :provider, :shelter_ids => [], shelters_attributes: [:name, :email, :address])
    end

end