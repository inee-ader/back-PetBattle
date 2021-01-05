class PetsController < ApplicationController

    def api

        

        array = [39, 40, 42, 43, 44, 45, 46, 47, 49, 56, 72, 87, 89, 107, 126, 143, 192]

        accessToken= "USYUxs9l7kXKRaTLzAGHbwZ0D31UwhbFK6"

        array.map do |id|
            

            response = RestClient.get "https://us.api.blizzard.com/data/wow/pet/#{id}?namespace=static-us&locale=en_US&access_token=#{accessToken}"

            json = JSON.parse response

            # byebug
            # params.require(:pet).permit(:id, :name, :type, :abilities, :hp, :user, :level, :exp)

            abilities = [json["abilities"][2]["ability"]["name"], json["abilities"][3]["ability"]["name"], json["abilities"][4]["ability"]["name"], json["abilities"][5]["ability"]["name"]]
            
            if json 
                
            Pet.create(name: json["name"], pet_type: json["battle_pet_type"]["name"], abilities: abilities, hp: [10..30].sample, user: User.first)
            

            end

            
        end

        

    end


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
