class CounselorProfilesController < ApplicationController
    def index
        render json: CounselorProfile.all
    end
    def show
        counselor = CounselorProfile.find(params[:id])
        render json: counselor, status: :ok
    end
    def destroy
        counselor = CounselorProfile.find(params[:id])
        counselor.destroy
        head :no_content
    end
    def create
        profile = CounselorProfile.create!(counselor_profile_params)
        render json: profile, status: :created
    end
    def verify
        counselor = CounselorProfile.find(params[:id])
        counselor.update(verified: true)
        counselor.user.is_counselor = true
        render json: counselor, status: :created
    end
    private
    def counselor_profile_params
        params.permit(:user_id, :specialization, :bio, :verified, :experience)
    end
end
