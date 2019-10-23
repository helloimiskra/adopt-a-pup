class SheltersController < ApplicationController

    def new
        @shelter = Shelter.new
    end

    def create
        shelter = Shelter.create(shelter_params)
        if shelter.save
            @shelter = shelter
            redirect_to shelter_path(@shelter)
        else
            render :new
        end
    end

    def show
        @shelter = Shelter.find_by(params[:id])
    end

    def edit
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

end