class PetsController < ApplicationController
    before_action :require_login
    def new
        @pet = Pet.new
    end

    def index
        if params[:shelter_id]
            @pets = Shelter.find(params[:shelter_id]).pets
        elsif !params[:gender].blank?
            if params[:gender] == "Boy"
                @pets = Pet.boys
            else
                @pets = Pet.girls
            end
        else
            @pets = Pet.all
        end
    end

    def create
        @shelters = Shelter.find_by(user_id: current_user.id)
        @pet = Pet.create(pet_params)
        if @pet.save
            @pet.user_id = current_user.id
            @pet.save
            redirect_to pet_path(@pet)
        else
            render :new
        end
    end

    def show
        @pet = Pet.find_by(id: params[:id])
    end

    def edit
        @shelters = Shelter.find_by(user_id: current_user.id)
        @pet = Pet.find_by(id: params[:id])
    end


    def update
        @pet = Pet.find_by(id: params[:id])
        @pet.update(pet_params)
        if @pet.adopted == true
            @pet.user_id = current_user.id

            @pet.save
        end
        redirect_to pet_path(@pet)
    end

    def application
        @pet = Pet.find_by(id: params[:id])
        @pet.update(pet_params)
        @pet.user_id = current_user.id
        @pet.save
        redirect_to pet_path(@pet)
    end

    private
    
    def pet_params
        params.require(:pet).permit(:name, :pet_type, :gender, :neutered, :breed, :description, :adopted, :shelter_id)
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end


end
