class ApplicationController < ActionController::API
    wrap_parameters false
    before_action :authorized
    def encode_token(payload)
        JWT.encode(payload, "Todo: change secret")
    end

    def auth_header
        request.headers['Authorization']
    end

    def decode_token
        if auth_header
            token = auth_header.split(" ")[1]
            begin
                JWT.decode(token, "Todo: change secret", true ) 
            rescue JWT::DecodeError                
                nil
            end
        end
    end
    def current_user
        payload = decode_token
        if payload
            user_id = payload[0]['user_id']
            return User.find_by(id: user_id)
        end
        nil
    end
    def logged_in?
        !!current_user
    end
    
    def authorized
        render json: {"error": "Unauthorized"}, status: :unauthorized unless logged_in?
    end
end
