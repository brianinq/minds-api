class CounselorProfilesController < ApplicationController
    def index
        render json: CounselorProfile.all
    end
    def show
        counselor = CounselorProfile.find(params[:id])
        render json: counselor, status: :ok
    end
    def update
        counselor = CounselorProfile.find(params[:id])
        render json: counselor, status: :ok
    end
    def create
        profile = CounselorProfile.create!(counselor_profile_params)
        render json: profile, status: :created
    end

    private
    def counselor_profile_params
        params.permit(:user_id, :specialization, :bio, :verified, :experience)
    end
end
