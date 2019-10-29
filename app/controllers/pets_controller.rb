class PetsController < ApplicationController

    def new
        @pet = Pet.new
    end

    def index
        if params[:shelter_id]
            @pets = Shelter.find(params[:shelter_id]).pets
        else
            @pets = Pet.all
        end
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
        @pet = Pet.find_by(id: params[:id])
    end

    def edit
        @pet = Pet.find_by(id: params[:id])
    end


    def update
        @pet = Pet.find_by(id: params[:id])
      
        @pet.update(pet_params)
        redirect_to pet_path(@pet)
    end

    def application
        @pet = Pet.find_by(id: params[:id])
    end

    private
    
    def pet_params
        params.require(:pet).permit(:name, :pet_type, :breed, :description, :adopted, :shelter_id)
    end


end
