class TeamsController < ApplicationController
    def index
        teams = Team.all
        render json: teams
    end

    def show
        team = Team.find(params[:id])
        render json: team
    end

    def create
        team = Team.new(team_params) 
        
        if team.save 
            render json: team
        else
            render json: team.errors
        end
    end

    private

    def team_params
        params.require(:team).permit(:id, :name, :user)
    end

end
