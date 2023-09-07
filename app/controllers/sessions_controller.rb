class SessionsController < ApplicationController
  def create
    patient = Patient.find_by(username: params[:username])
    if patient&.authenticate(params[:password])
      session[:patient_id] = patient.id
      render json: patient, status: :created
    else
      render json: { errors: ["invalid username or password"] }, status: :unauthorized
    end
  end

  def destroy
    session.delete :patient_id
    head :no_content
  end
end
