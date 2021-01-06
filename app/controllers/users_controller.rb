class UsersController < ApplicationController
    def index
        users = User.all()
        render json: users
    end

    def login
        user = User.find_by(name: params[:name])
        if user && user.authenticate(params[:password])
            token = encode_token({user_id: user.id})
            render json: {user: UserSerializer.new(user), token: token}
        else
            render json: {error: "Incorrect Name or Password"}
        end

    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def create
        user = User.new(user_params) 
        
        if user.save 
            token = encode_token({user_id: user.id})
            
            
            api
    
            render json: {user: user, token: token}
            
        else
            render json: user.errors
        end
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        if user.save
            render json: user
        else
            render json: user.errors
        end   
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: user
    end

    def newgame
        puts params
        current_user
        # find selected pets, 3 of them
        
        #     pet1 = Pet.find(|pet| pet.id == pet we pass in (from where?) )
        #     # pet2 = Pet.find(|pet| pet.id == pet we pass in  )
        #     # pet3 = Pet.find(|pet| pet.id == pet we pass in  )

        #  create team with those pets, does this have to be in pet_teams?
        
        # team = Team.new(team_params)
        
        #  create game with that team

        # game = Game.new(game_params)

        #  create boss with that game

        # boss = Boss.new(boss_params)
        # byebug
    end

    private

    def user_params
        params.require(:user).permit(:id, :password, :name, :alias, :bio, :gif_url)
    end

    def team_params
        params.require(:team).permit(:user)
    end

    def game_params
        params.require(:game).permit(:win, :user_id, :team_id)
    end

    def boss_params 
        params.require(:boss).permit(:name, :hp, :base_damage, :img_url, :abilities, :game_id)
    end

end
