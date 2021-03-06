class PetsController < ApplicationController
    before_action :require_login

    def new
        if params[:shelter_id]
            @pet = Pet.new(shelter_id: params[:shelter_id])
        else
            @pet = Pet.new
        end
    end

    def index
        if params[:shelter_id]
            @pets = Shelter.find_by(id: params[:shelter_id]).pets
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
        @pet = Pet.create(pet_params)
        @pet.user_id = current_user.id
        @pet.shelter_id = current_user.shelters.last.id
        if @pet.valid?
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
        @pet = Pet.find_by(params[:id])

        @pet.update(pet_params)
        @pet.user_id = current_user.id
        @pet.save
        redirect_to pet_path(@pet)
    end

    private
    
    def pet_params
        params.require(:pet).permit(:name, :pet_type, :gender, :neutered, :breed, :description, :adopted, :shelter_id, :city_id)
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end


end
