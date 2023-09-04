class AppointmentsController < ApplicationController
  def index
    appointments = Appointment.all 
    render json: appointments 
  end

  def create 
    appointment = Appointment.new(appointment_params) 
    if appointment.save 
      render json: appointment 
    else
      render json: { errors: appointment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private 
  def appointment_params
    params.permit(:description)
  end
end
