class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:index]
    
    def index
        render json: Session.all, status: :ok
    end
    def show
        session = Session.find(params[:id])
        render json: session
    end
    def create
        session = Session.create!(session_params)
        render json: session, status: :created
    end
    def destroy
        session = Session.create!(session_params)
        head :no_content
    end

    private
    def session_params
        params.permit(:counselor_profile_id, :time, :topic, :title, :description, :maximum, :location)
    end
end
