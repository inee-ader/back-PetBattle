class PetsController < ApplicationController
    def index
        pets = Pet.all
        render json: pets
    end

    def create
        pet = Pet.new(pet_params) 
        
        if pet.save 
            render json: pet
        else
            render json: pet.errors
        end
    end

    def update
        pet = Pet.find(params[:id])
        pet.update(pet_params)

        if pet.save
            render json: pet
        else
        render json: pet.errors
        end
    end

    private

    def pet_params
        params.require(:pet).permit(:id, :name, :type, :abilities, :hp, :user, :level, :exp)
    end
end
