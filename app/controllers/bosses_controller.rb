class BossesController < ApplicationController
    def index 
        bosses = Boss.all
        render json: bosses
    end

    def create
        boss = Boss.new(boss_params)
        if boss.save 
            render json: boss
        else
            render json: boss.errors
        end
    end

    def update
        boss = Boss.find(params[:id])
        boss.update(boss_params)

        if boss.save
            render json: boss
        else
        render json: boss.errors
        end
    end

    private

    def boss_params
        params.require(:boss).permit(:id, :name, :hp, :abilities, :base_damage, :game, :img_url)
    end
end
