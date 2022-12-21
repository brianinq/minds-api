class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
    skip_before_action :authorized, only: [:create]

    def profile
        render json: current_user, serializer: UserSerializer, status: :accepted
    end

    def create
       user = User.create!(user_params)
        if user.valid? 
            token = encode_token({user_id: user.id})
            render json: {user: UserSerializer.new(user), jwt: token}, status: :created
        else
            render json: {error: "Failed to create user"}, status: :unprocessable_entity
        end 
    end


    private
    def user_params
        params.permit(:name, :username, :password, :password_confirmation, :email, :age, :gender, :avatar )
    end
    def ivalid_record(e)
        render json: {errors: e.record.errors.full_messages}, status: 422
    end
end
