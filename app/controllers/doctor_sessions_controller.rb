class DoctorSessionsController < ApplicationController
  def create
    doctor = Doctor.find_by(username: params[:username])
    if doctor&.authenticate(params[:password])
      session[:doctor_id] = doctor.id
      render json: doctor, status: :created
    else
      render json: { error: ["Invalid username or password"] }, status: :unauthorized
    end
  end

  def destroy
    session.delete :doctor_id
    head :no_content
  end
end
