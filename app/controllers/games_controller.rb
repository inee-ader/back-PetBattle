class GamesController < ApplicationController
    def index
        games = Game.all 
        render json: games
    end

    def show
        game = Game.find(params[:id])
        render json: game
    end

    def create
        game = Game.new(game_params)

        if game.save 
            render json: game
        else
            render json: game.errors
        end
    end

    private

    def game_params
        params.require(:game).permit(:id, :win, :exp, :gold, :user, :team)
    end
end
