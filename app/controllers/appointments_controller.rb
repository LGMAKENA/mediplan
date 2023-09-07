class AppointmentsController < ApplicationController
  
  def index
    render json: Appointment.all
  end

  def create
    appointment = Appointment.create!(appointment_params)
    render json: appointment, status: :created
  end

  def show
    # appointment = Appointment.find_by(id: params[:appointment_id])
    appointment = find_appointment
    render json: appointment
  end

  def update
    appointment = find_appointment
    appointment.update!(appointment_params)
    render json: appointment
  end

  def destroy
    appointment = find_appointment
    appointment.destroy
    head :no_content
  end

  private

  def find_appointment
    Appointment.find(params[:id])
  end

  def appointment_params
    params.permit(:description, :patient_id, :doctor_id, :date_time)
  end
end
