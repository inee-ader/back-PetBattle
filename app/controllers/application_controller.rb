class ApplicationController < ActionController::API
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
end
