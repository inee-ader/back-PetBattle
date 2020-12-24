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

    private

    def user_params
        params.require(:user).permit(:id, :name, :alias, :bio, :gif_url)
    end

end
