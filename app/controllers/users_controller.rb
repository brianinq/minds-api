class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
    skip_before_action :authorized, only: [:create]

    def profile
        render json: current_user, serializer: UserSerializer, status: :ok
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
    def update
        user = User.find(params[:id])
        user.update!(user_params)
        render json: user
    end
    def show
        user = User.find(params[:id])
        render json: user
    end

    def stats
        if !current_user.is_admin
            return render json: {"error": "Unauthorized"}, status: :unauthorized
        end
        render json: {users: User.count, counselors: CounselorProfile.count, sessions: Session.count, appointments: Appointment.count }, status: :ok
    end

    private
    def user_params
        params.permit(:name, :username, :password, :password_confirmation, :email, :age, :gender, :avatar, :is_counselor )
    end
    def ivalid_record(e)
        render json: {errors: e.record.errors.full_messages}, status: 422
    end
end
