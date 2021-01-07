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
            
            api(user)
    
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
        # puts params
        # puts current_user.id
        # find selected pets, 3 of them
        pet1 = params["team"][0]["id"]
        pet2 = params["team"][1]["id"]
        pet3 = params["team"][2]["id"]
        
        #  create team with those pets
        team = Team.create(user: User.find(current_user.id))
        PetTeam.create(team: team, pet:Pet.find(pet1))
        PetTeam.create(team: team, pet:Pet.find(pet2))
        PetTeam.create(team: team, pet:Pet.find(pet3))
        
        #  create game with that team
        game = Game.create(user:User.find(current_user.id), team: team)
        
        #  create boss with that game
        hp = [100, 150, 200, 250]
        abilities = []
        4.times {
            abilities << Faker::Games::StreetFighter.move
        }
        # Faker::Games::DnD.monster
        
        boss = Boss.create(name: "Manticore", hp: hp.sample, base_damage: rand(5..20), img_url: "https://www.cleanpng.com/png-dragon-nest-youtube-manticore-legendary-creature-c-940114/", abilities: abilities, game: game)

        render json: game
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
