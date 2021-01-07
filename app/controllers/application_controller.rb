class ApplicationController < ActionController::API
    # before_action :authorized

    def encode_token(payload)
        JWT.encode(payload, 'bed3c53a00d253ab45db5c691b6deb9e')
    end

    def auth_header
        request.headers['Authorization']
    end
    
    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, 'bed3c53a00d253ab45db5c691b6deb9e')
            rescue JWT::DecodeError
                nil
            end
        end
    end
    
    def current_user
        if decoded_token
            user_id = decoded_token[0]['user_id']
            current_user = User.find(user_id)
        end
    end

    def logged_in?
        !!current_user
    end

    def authorized
        render json: {error: "Please log in"}, status: :unauthorized unless logged_in?
    end

    def api(user)
        
        array = [ 164, 166, 188, 197, 210, 225, 239, 242, 244, 255, 272, 278, 289, 296, 381]

        accessToken= "USCTfiZmWjha1DyyTWnUGIbmJl7K13P9kl"

        array.map do |id|

            response = RestClient.get "https://us.api.blizzard.com/data/wow/pet/#{id}?namespace=static-us&locale=en_US&access_token=#{accessToken}"

            json = JSON.parse response

            abilities = [json["abilities"][2]["ability"]["name"], json["abilities"][3]["ability"]["name"], json["abilities"][4]["ability"]["name"], json["abilities"][5]["ability"]["name"]]

            hp = [25, 30, 40, 50]
            
            if json         
                Pet.create(name: json["name"], pet_type: json["battle_pet_type"]["name"], description: json["description"], abilities: abilities, hp: hp.sample, img_url: json["icon"], user: user) 
            end
        end
    end
end
