class PetsController < ApplicationController

    def new
        @pet = Pet.new
    end

    def index
        @pets = Pet.all
    end

    def create
        pet = Pet.create(pet_params)
        if pet.save
            @pet = pet
            redirect_to pet_path(@pet)
        else
            render :new
        end
    end

    def show
        @pet = Pet.find_by(params[:id])
    end

    def edit
    end


    def update
        @pet = Pet.find(params[:id])
        @pet.update(pet_params)
        redirect_to pet_path(@pet)
    end


    private
    
    def pet_params
        params.require(:pet).permit(:name, :pet_type, :breed, :description, :adopted)
    end


end
