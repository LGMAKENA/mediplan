class AppointmentsController < ApplicationController
  #before_action :require_login 

  def index
    appointments = Appointment.all 
    render json: appointments 
  end

  # def index
  #   if current_user.is_a?(Doctor)
  #     appointments = Appointment.all
  #   elsif current_user.is_a?(Patient)
  #     appointments = current_user.appointments
  #   end
  #   render json: appointments  
  # end
 
  def show 
    appointment = Appointment.find_by(id: params[:appointment_id]) 
    render json: appointment 
  end

  def create 
    appointment = Appointment.new(appointment_params) 
    if appointment.save 
      render json: appointment, status: :created 
    else
      render json: { errors: appointment.errors.full_messages }, status: :unprocessable_entity
    
    end
  end

  def update  
    appointment = Appointment.find_by(id: params[:id]) 
    if appointment.update(appointment_params) 
      render json: appointment   
    else
      render json: { "errors": "appointment not found" }, status: :not_found 
    end
  end
 
  def destroy 
    appointment = Appointment.find_by(id: params[:id]) 
    if appointment
    appointment.destroy  
    head :no_content 
    else
      render json: { "errors": "appointment not found"  }, status: :not_found 
    end
  end 

  private 

  def appointment_params
    params.permit(:description, :patient_id, :doctor_id, :date_time) 
  end
end 
