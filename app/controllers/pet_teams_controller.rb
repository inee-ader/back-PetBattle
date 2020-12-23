class PetTeamsController < ApplicationController
    def index
        pet_teams = PetTeam.all
        render json: pet_teams 
    end

    def show 
        pet_team = PetTeam.find(params[:id])
        render json: pet_team
    end

    def create
        pet_team = PetTeam.new(pet_team_params)

        if pet_team.save 
            render json: pet_team
        else
            render json: pet_team.errors
        end
    end

    private

    def pet_team_params
        params.require(:pet).permit(:id, :pet, :team)
    end

end
