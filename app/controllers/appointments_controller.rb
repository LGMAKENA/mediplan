class AppointmentsController < ApplicationController
  def index
    appointments = Appointment.all 
    render json: appointments 
  end

  def show 
    appointment = Appointment.find_by(id: params[:appointment_id]) 
    render json: appointment 
  end

  def create 
    appointment = Appointment.new(appointment_params) 
    if appointment.save 
      render json: appointment 
    else
      render json: { errors: appointment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update  
    appointment = Appointment.update!(appointment_params) 
    if appointment 
      render json: appointment 
    else
      render json: { errors: appointment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy 
    appointment = Appointment.find_by(id: params[:appointment_id]) 
    appointment.delete 
    head :no_content 
  end 

  private 
  def appointment_params
    params.permit(:description)
  end
end
