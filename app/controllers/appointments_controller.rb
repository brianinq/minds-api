class AppointmentsController < ApplicationController
    
    def index
        if params[:user_id]
            return render json: Appointment.all.where(user_id: current_user.id)
        end
        render json: Appointment.all
    end
    def create
        user = current_user
        appointment = Appointment.create(appointment_params)
        user.appointments << appointment
        render json: appointment, status: :created
    end

    def show
        appointment = Appointment.find(params[:id])
        render json: appointment
    end
    def update
        appointment = Appointment.find(params[:id])
        appointment.update!(appointment_params)
        record json: appointment
    end
    def destroy
        appointment = Appointment.find(params[:id])
        appointment.destroy
        head :no_content
    end
    def new_from_session
        user = current_user
        session = Session.find(params[:session_id])
        appointment = Appointment.create(
            counselor_profile_id: session.counselor_profile_id,
            time: session.time,
            topic: session.topic,
            title: session.title,
            description: session.description,
            location: session.location,
            approved: true
            
        )
        user.appointments << appointment
        render json: appointment
    end

    private
    def appointment_params
        params.permit(:counselor_profile_id, :time, :topic, :title, :description, :location, :approved )
    end
end
