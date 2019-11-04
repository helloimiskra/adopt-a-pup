class SheltersController < ApplicationController
    before_action :require_login
    def new
        @shelter = Shelter.new
       
    end

    def create
        @shelter = Shelter.create(shelter_params)
    
        if @shelter.valid?
            @shelter.user_id = current_user.id
            @shelter.save
            redirect_to shelter_path(@shelter)
        else
            flash[:alert] = "There was an error. Please try again."
            render :new
        end
    end

    def show
        
        @shelter = Shelter.find_by(id: params[:id])
    end

    def edit
        @shelter = Shelter.find_by(id: params[:id])
    end

    def index
        @shelters = Shelter.all
    end

    def update
        @shelter = Shelter.find(params[:id])
        @shelter.update(shelter_params)
        redirect_to shelter_path(@shelter)
    end


    private
    
    def shelter_params
        params.require(:shelter).permit(:name, :address, :email)
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end
end